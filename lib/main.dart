import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_clones/Constants.dart';
import 'package:ui_clones/aqar_app/aqar_app.dart';
import 'package:ui_clones/resturants_ui_app/resturants_ui_app.dart';

import 'AboutPage.dart';
import 'amazon_app/AmazonApp.dart';
import 'amazon_app/home_screen.dart';
import 'amazon_app/models.dart';
import 'aqar_app/services.dart';
import 'hangerstation_app/HnagerApp.dart';
import 'marso_app/MarsolApp.dart';
import 'noon_app/NoonApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appBarTheme = Theme.of(context).appBarTheme;
    // final theme = Theme.of(context);
    // final iconTheme = Theme.of(context).iconTheme;
    // final googleFont = GoogleFonts.cairoTextTheme(textTheme);


    var my = MultiProvider(
      providers: [
        ChangeNotifierProvider<Data>.value(
          value: Data.initalize(),
        ),
        // StreamProvider<Position>.value(value: LocationService().locationStream2),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        // appBarTheme: theme.appBarTheme.copyWith(
        //   color: ColorConstants.primaryColor,
        //   iconTheme: iconTheme.copyWith(color: Colors.black45),
        // ),
        // ),
        routes: {
          AmazonApp.id: (context) => AmazonApp(),
          NoonApp.id: (context) => NoonApp(),
          AqarApp.id: (context) => AqarApp(),
          HangerApp.id: (context) => HangerApp(),
          MarsolApp.id: (context) => MarsolApp(),
          RestaurantsApp.id: (context) => RestaurantsApp(),
          CartScreen.id: (context) => CartScreen(),
          ProductDetails.id: (context) => ProductDetails(),
        },
        home: HomePage(),
      ),
    );
    return FutureBuilder(
        // Initialize FlutterFire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return CircularProgressIndicator();
          }
          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return my;
          }
          // Otherwise, show something whilst waiting for initialization to complete
          return CircularProgressIndicator();
        });
  }
}

var AppsName = [
  Constants.AmazoneAppName,
  Constants.NoonAppName,
  Constants.HangerStationAppName,
  Constants.MarsolAppName,
  Constants.RestaurantsAppName,
  Constants.AqarAppName,
];
var AppsImage = [
  Constants.AmazoneLogo,
  Constants.NoonLogo,
  Constants.HangerStationLogo,
  Constants.MarsolAppLogo,
  Constants.RestaurantsAppLogo,
  Constants.AqarAppLogo,
];
var AppsUiPath = [
  Constants.AmazoneApp,
  Constants.NoonApp,
  Constants.HangerStationApp,
  Constants.MarsolApp,
  Constants.RestaurantsApp,
  Constants.AqarApp,
];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var places = Provider.of<Data>(context, listen: false).Places;
    var v = places.length;
    print("Places in main : $v");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        title: Text(
          "Ui Clones Demo",
          style: GoogleFonts.cairo(
              textStyle: Theme.of(context).textTheme.display1,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          },
          child: Container(
            // color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 6.0,
              ),
              child: Image.asset("assets/images/myIcon.png"),
            ),
          ),
        ),
        actions: [
          // IconButton(
          //     icon: Icon(
          //       LineIcons.sun_o,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {})
        ],
      ),
      body: ListView.builder(
        itemCount: AppsName.length,
        itemBuilder: (context, index) {
          return ListRow(
              AppsName[index], AppsImage[index], AppsUiPath[index], places);
        },
      ),
    );
  }
}

class ListRow extends StatelessWidget {
  final String AppName;
  final String AppImage;
  final String AppsUiPath;
  final List<Place> numOFItems;

  ListRow(this.AppName, this.AppImage, this.AppsUiPath, this.numOFItems);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          if (AppName.isNotEmpty) {
            Navigator.pushNamed(context, AppsUiPath);
          } else {
            // log("Cart items : ${cartitems.length}");
          }
        },
        leading: CircleAvatar(
          child: Container(
            // color: Colors.orange,
            // width: 150,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Image.asset(
                AppImage,
                scale: 1,
              ),
            ),
          ),
        ),
        title: Text(
          AppName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// ================================================= Amazon App  ==========================================================================================

/// ================================================= Noon App  ==========================================================================================
