import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:ui_clones/amazon_app/models.dart';
import 'package:ui_clones/aqar_app/PlaceItem.dart';
import 'package:ui_clones/aqar_app/services.dart';

import '../Constants.dart';

void main() => runApp(AqarApp());

class AqarApp extends StatefulWidget {
  static const String id = "AqarApp";

  @override
  _AqarAppState createState() => _AqarAppState();
}

class _AqarAppState extends State<AqarApp> {
  /// FireStore ====================================================

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = GlobalKey<ScaffoldState>();

  /// Map View
  Completer<GoogleMapController> googleMapContrroller = Completer();

  Set<Marker> _markers = Set<Marker>();
  final LatLng _center = const LatLng(23.0813, -45.9175);
  BitmapDescriptor ico;
  bool _showMapStyle = false;
  Position currentLocation;
  var isMapView = true;
  List<Place> places = <Place>[];
  Geoflutterfire geo = Geoflutterfire();
  BehaviorSubject<double> radius = BehaviorSubject<double>.seeded(100.00);
  Stream<dynamic> query;
  StreamSubscription subscription;

  SolidController scroll_controller = SolidController();

  /// Dialoag
  TextEditingController _textFieldControllerName;
  TextEditingController _textFieldControllerlat;
  TextEditingController _textFieldControllerlng;
  String name;
  String lat;
  String lng;

  ///

  init() async {
    await setMarckerIcon();
  }

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUserLocation().then((value) {
      setState(() {
        currentLocation = value;
      });
    });

    _textFieldControllerName = TextEditingController();
    _textFieldControllerlat = TextEditingController();
    _textFieldControllerlng = TextEditingController();
    this.lat = _textFieldControllerlat.text;
    this.name = _textFieldControllerName.text;
    this.lng = _textFieldControllerlng.text;

    init();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  Widget _MapView() {
    return Stack(children: [
      Container(
        child: GoogleMap(
          // onMapCreated: _onMapCreated,
          onMapCreated: (GoogleMapController controller) async {
            googleMapContrroller.complete(controller);
            // await getMarkres();
          },
          mapType: MapType.normal,
          myLocationEnabled: true,
          markers: _markers,

          initialCameraPosition: CameraPosition(
            // target: LatLng(currentLocation.latitude,currentLocation.longitude),
            target: _center,
            zoom: 1.0,
          ),
        ),
      ),

      /// Top Bar
      Align(
          alignment: AlignmentDirectional.topCenter, child: CustomBarWidget()),

      /// Left  Bar
      Container(
        // color: Colors.orange.withOpacity(0.4),
        width: 60,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "41",
                  backgroundColor: Colors.white70,
                  onPressed: () async {
                    setState(() {
                      _showMapStyle = !_showMapStyle;
                    });

                    _toggleMapStyle();
                  },
                  child: Icon(
                    Icons.map,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),

            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "44",
                  backgroundColor: Colors.white70,
                  onPressed: () async {
                    print(
                        "Hi ${currentLocation.latitude} _ ${currentLocation.longitude}");
                    GoogleMapController c = await googleMapContrroller.future;
                    c.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                            zoom: 5,
                            target: LatLng(currentLocation.latitude,
                                currentLocation.longitude)),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "71",
                  backgroundColor: Colors.white70,
                  onPressed: () async {
                    // await _addGeoPoint();
//                           var a = 23.8337681;
//                           var b = 54.1097969;
//                           var rndPostion = Random();
//                           var rndName = Random();
//
//                           for (var i = 0; i < 100; i++) {
// //                            print(rndPostion.nextDouble() + rndPostion.nextInt(50));
// //                            var r = rndPostion.nextInt(50).toDouble() + rndPostion.nextInt(50).toDouble();
// //                            print(r);
// //                            var r = a = rndPostion.nextInt(b.toInt() - a.toInt()).toDouble();
//                             var lat = doubleInRange(rndPostion, a.toInt(), b.toInt());
//                             var long = doubleInRange(rndPostion, a.toInt(), b.toInt());
//                             print(" LAT :$lat ");
//                             print(" LONG :$long ");

                    // addNewMarker(
                    //     position: LatLng(lat, long),
                    //     address: "${names[rndName.nextInt(10)]}");
                    // }
                  },
                  child: Icon(
                    Icons.add_location_sharp,
                    color: Colors.black45,
                  ),
                ),
              ),
            ), //
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  mini: true,
                  heroTag: "51",
                  backgroundColor: Colors.white70,
                  onPressed: () async {
                    setState(() {
                      isMapView = false;
                    });
                  },
                  child: Icon(
                    Icons.dehaze,
                    color: Colors.black45,
                  ),
                ),
              ),
            ), //
          ],
        ),
      ),
      // Align(
      //   alignment: AlignmentDirectional.centerStart,
      //   child: Container(
      //     height: 50,
      //     color: Colors.white,
      //     child: Slider(
      //       min: 100.00,
      //       max: 400.00,
      //       divisions: 4,
      //       value: radius.value,
      //       label: "Radius ${radius.value} Km",
      //       onChanged: _updateQuery,
      //       activeColor: Colors.green,
      //       inactiveColor: Colors.green.withOpacity(0.2),
      //     ),
      //   ),
      // ),
    ]);
  }

  Widget _ListView() {
    return Container(
        child: Scaffold(
      key: _scaffoldKey2,
      appBar: AppBar(
        centerTitle: true,
        title: Text("عقارات"),
        actions: [
          GestureDetector(
              onTap: () {
                setState(() {
                  isMapView = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.map),
              ))
        ],
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: places
              .map((item) => GestureDetector(
                    onTap: () async {
                      // app.changeLoading();
                      // await placesProvider.loadProductsbyRestaurant(item.id);
                      // app.changeLoading();
                      // changeScreen(context, RestaurantScreen(restaurantModel: item));
                    },
                    child: PlaceItem(
                      restaurant: item,
                    ),
                  ))
              .toList(),
        ),
      )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    places = Provider.of<Data>(context, listen: false).Places;
    print("places : ${places.length}");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          bottomSheet: buildSolidBottomSheet(),
          body: isMapView ? _MapView() : _ListView(),
        ),
      ),
    );
  }

  Dialog addDialog() {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    maxLength: 10,
                    // keyboardType: getType(_currentContactMethod),
                    controller: _textFieldControllerName,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "إسم العقار",
                        icon: Icon(Icons.drive_file_rename_outline)),
                    textDirection: TextDirection.rtl,
                    inputFormatters: <TextInputFormatter>[],
                    validator: (input) => input.trim().length < 10
                        ? 'Please enter a valid Number'
                        : null,
                    onSaved: (String val) {
                      name = val;
                    },
                    onChanged: (val) => setState(() => name = val),
                  ),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _textFieldControllerlng,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "long",
                        icon: Icon(Icons.add_location_sharp)),
                    textDirection: TextDirection.rtl,
                    inputFormatters: <TextInputFormatter>[],
                    validator: (input) => input.trim().length < 10
                        ? 'Please enter a valid Number'
                        : null,
                    onSaved: (String val) {
                      lng = val;
                    },
                    onChanged: (val) => setState(() => lng = val),
                  ),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: _textFieldControllerlat,
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "lat",
                        icon: Icon(Icons.add_location_sharp)),
                    textDirection: TextDirection.rtl,
                    inputFormatters: <TextInputFormatter>[],
                    validator: (input) => input.trim().length < 10
                        ? 'Please enter a valid Number'
                        : null,
                    onSaved: (String val) {
                      lat = val;
                    },
                    onChanged: (val) => setState(() => lat = val),
                  ),
                  FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0)),
                      splashColor: Colors.blueAccent,
                      color: Colors.blueAccent,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              Center(
                                child: new Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Center(
                                    child: Text(
                                      "إضافة ",
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              new Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      onPressed: () async {
                        await _addGeoPoint();
                        Navigator.pop(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  SolidBottomSheet buildSolidBottomSheet() {
    return SolidBottomSheet(
      maxHeight: 120,
      controller: scroll_controller,
      draggableBody: true,
      headerBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: FloatingActionButton(
                          mini: true,
                          elevation: 1,
                          heroTag: "1",
                          backgroundColor: Colors.white70,
                          onPressed: () => print(''),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text('الخدمات'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        elevation: 1,
                        backgroundColor: Colors.white70,
                        mini: true,
                        heroTag: "btn2",
                        onPressed: () async {
                          await getMarkres();
                        },
                        child: Icon(
                          Icons.message,
                          color: Colors.black,
                        ),
                      ),
                      Text('محادثة'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        elevation: 1,
                        backgroundColor: Colors.green,
                        heroTag: "btn3",
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return addDialog();
                              });
                        },
                        child: Icon(
                          Icons.add,
                          size: 40,
                        ),
                      ),
                      Text('إعلان جديد'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        elevation: 1,
                        backgroundColor: Colors.white70,
                        heroTag: "btn4",
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(
                          Icons.map,
                          color: Colors.black,
                        ),
                      ),
                      Text('المناطق'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        elevation: 1,
                        backgroundColor: Colors.white70,
                        mini: true,
                        heroTag: "btn5",
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                      Text('إعلان جديد'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: Colors.white70,
                        elevation: 2,
                        mini: true,
                        heroTag: "q",
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(Icons.notifications, color: Colors.black),
                      ),
                      Text('طلباتي'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        heroTag: "w",
                        elevation: 2,
                        backgroundColor: Colors.white70,
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(FontAwesomeIcons.handshake,
                            color: Colors.black),
                      ),
                      Text('حلول تسويقية'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        elevation: 2,
                        backgroundColor: Colors.white70,
                        heroTag: "e",
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(FontAwesomeIcons.shoppingBag,
                            color: Colors.black),
                      ),
                      Text('البناء والمقاولات'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        elevation: 2,
                        backgroundColor: Colors.white70,
                        heroTag: "r",
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(FontAwesomeIcons.fileArchive,
                            color: Colors.black),
                      ),
                      Text(' عقود  الأيجار'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      FloatingActionButton(
                        mini: true,
                        elevation: 2,
                        backgroundColor: Colors.white70,
                        heroTag: "t",
                        onPressed: () {
                          //                    getMarkers();
                        },
                        child: Icon(FontAwesomeIcons.calculator,
                            color: Colors.black),
                      ),
                      Text('حاسبه التمويل'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Methods ==============================================================================

  _CreateNewPlace() async {
    print("_CreateNewPlace : Called");

    Place place;
    var a = name;
    var b = "testName";
    var c = "testName";
    var _lat = double.parse(lat);
    var _long = double.parse(lng);
    var geopoint = GeoPoint(_lat, _long);
    place = Place(a, b, geopoint, c);
    return place;
  }

  Future<DocumentReference> _addGeoPoint() async {
    print("_addGeoPoint : Called");

    // UserLocation userLocation = UserLocation(latitude:currentLocation.latitude,longitude: currentLocation.longitude );
    Place place = await _CreateNewPlace();
    var map = {
      'geopoint': place.geoPoint,
      'name': place.name,
      'type': place.type,
      'Image': place.Image,
    };

    // await calculateDistance(place);

    // radius.stream.listen((event) async {});
    // addNewMarker2(
    //     position: LatLng(currentLocation.latitude, currentLocation.longitude));
    // GeoFirePoint point = geo.point(
    //     latitude: currentLocation.latitude,
    //     longitude: currentLocation.longitude);
    // return firestore.collection("locations").add({'position': point.data, 'name': 'hi u can query me bro'});
    return firestore.collection("places").add(map);
  }

  calculateDistance(Place place) async {
    GeoFirePoint point = geo.point(
        longitude: place.geoPoint.longitude, latitude: place.geoPoint.latitude);
    var dis = point.distance(
        lat: place.geoPoint.latitude, lng: place.geoPoint.longitude);
    var dis2 = geolocator.Geolocator.distanceBetween(
        currentLocation.latitude,
        currentLocation.longitude,
        place.geoPoint.latitude,
        place.geoPoint.longitude);
    // var dis3 = geolocator.Geolocator.distanceBetween(26.127398,44.022813,26.1238158,44.0129319);
    var disInKm = dis2 / 1000;
    return disInKm.toStringAsFixed(2);
    // var disInKm2 = dis3/1000 ;
    print(disInKm.toStringAsFixed(2));
    // print(disInKm2.toStringAsFixed(2));
  }

  getMarkres() async {
    var pos = currentLocation;
    double lat = pos.latitude;
    double lng = pos.longitude;
    GeoFirePoint cLocation = geo.point(latitude: lat, longitude: lng);
    print("getMarkres :Called");
    print("pos :${pos.longitude}");
    BitmapDescriptor markericon = await _getAssetIcon(context);
    // var places = Provider.of<Data>(context,listen: false).Places;
    setState(() {
      _markers.clear();
    });
    if (places.isEmpty) {
      print("List Is Empty");
      setState(() {
//        clientsToggle = true;
      });
    }
    for (var place in places) {
      print(
          "getMarkersFromList2 :${place.geoPoint.latitude} - ${place.geoPoint.longitude}");
      var s = await calculateDistance(place);

      _markers.add(
        Marker(
          markerId: MarkerId(place.name),
          infoWindow: InfoWindow(title: "$s Km, ${place.name}"),
          icon: markericon,
          //            position: LatLng(doc.data['geoPoint']['Latitude'], doc.data['geoPoint']['Longitude']),
          position: LatLng(place.geoPoint.latitude, place.geoPoint.longitude),
        ),
      );
    }

    setState(() {
      _markers = _markers;
    });
    print(
        "getMarkersFromList2 : _markers Count : ${_markers.length.toString()}");

    // return markers;
  }

  void _toggleMapStyle() async {
    String style =
        await DefaultAssetBundle.of(context).loadString('assets/mapstyle.json');
    GoogleMapController mapController = await googleMapContrroller.future;

    if (_showMapStyle) {
      mapController.setMapStyle(style);
    } else {
      mapController.setMapStyle(null);
    }
  }

  double doubleInRange(Random source, int start, int end) =>
      source.nextDouble() * (end - start) + start;

  int IntInRange(Random source) => source.nextInt(9);

  void addNewMarker({LatLng position, String address}) async {
    print("object");
    print("${_markers.length}");
    var rndId = Random().nextInt(300);
    final MarkerId markerId = MarkerId('$rndId');
    BitmapDescriptor markericon = await _getAssetIcon(context);
    // creating a new MARKER
    var rndPrice = Random().nextInt(1000);

    final Marker marker = Marker(
        markerId: markerId,
        position: position,
        infoWindow: InfoWindow(title: "$rndPrice ألف ", snippet: address),
        icon: markericon);
    GoogleMapController controller = await googleMapContrroller.future;
    CameraPosition currentPosition = CameraPosition(
        bearing: 15.0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        tilt: 75.00,
        zoom: 12.0);

    // controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
    setState(() {
      _markers.add(marker);
    });
  }

  void addNewMarker2({LatLng position, String address}) async {
    print("addNewMarker2 Called");
    print("_markers : ${_markers.length}");
    var rndId = Random().nextInt(300);
    final MarkerId markerId = MarkerId('$rndId');

    final Marker marker = Marker(
        markerId: markerId,
        position: position,
        infoWindow: InfoWindow(title: "Maker"),
        icon: BitmapDescriptor.defaultMarker);
    GoogleMapController controller = await googleMapContrroller.future;
    CameraPosition currentPosition = CameraPosition(
        bearing: 15.0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        tilt: 75.00,
        zoom: 12.0);

    // controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
    setState(() {
      _markers.add(marker);
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(BuildContext context) async {
    final Completer<BitmapDescriptor> bitmapIcon =
        Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context);

    const AssetImage("assets/images/shape.png")
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData bytes =
          await image.image.toByteData(format: ImageByteFormat.png);
      final BitmapDescriptor bitmap =
          BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }

  /// Marker Icon From Assets
  setMarckerIcon() async {
    await BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "assets/images/shape.png")
        .then((d) {
      ico = d;
    });
  }

  // void _onMapCreated(GoogleMapController controller) async {
  //   mapController = controller;
  //   await getMarkres();
  // }

  Future<geolocator.Position> getCurrentUserLocation() async {
    print("getCurrentUserLocation :  Called");

    /// CurrentLocation
    currentLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.best);
    print("getCurrentUserLocation :  $currentLocation");

    /// CameraPosition
    CameraPosition currentPosition = CameraPosition(
        bearing: 15.0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        tilt: 75.00,
        zoom: 3.0);
    GoogleMapController controller = await googleMapContrroller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
    return currentLocation;
  }
}

///  ==============================================================================

class CustomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 60,
      // color: Colors.green.withOpacity(0.1),
      child: Stack(
        children: <Widget>[
          Row(
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 1.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.5), width: 1.0),
                        color: Colors.white),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                            children: names
                                .map<Widget>((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e),
                                    ))
                                .toList())),
                  ),
                ),
              ),
              Container(
                // color: Colors.black54,
                height: 40,
                width: 3,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 60,
                  // width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.5), width: 1.0),
                        color: Colors.white),
                    child: Icon(
                      Icons.search,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var places = Provider.of<Data>(context).Places;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      // Let the ListView know how many items it needs to build.
      itemCount: places.length,
      // Provide a builder function. This is where the magic happens.
      // Convert each item into a widget based on the type of item it is.
      itemBuilder: (context, index) {
        return ListTile(
          trailing: Center(
            child: Text("${places[index].name}"),
          ),
          leading: Center(
            child: Text("${places[index].geoPoint}"),
          ),
        );
      },
    );
  }
}

// class LocationRow extends StatelessWidget {
//   int index;
//   Place place;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 600.0,
//         child: Stack(
//           children: <Widget>[
//             Container(
//               color: Colors.blueGrey,
//               child: Text(
//                 "${places[index]}",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
