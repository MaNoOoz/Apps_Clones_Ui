import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ui_clones/amazon_app/models.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce_api/woocommerce_api.dart';

import 'ProductPage.dart';
import 'WordPressApi.dart';

void MarsolAppMain() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.cairoTextTheme(txtTheme)),
      home: MarsolApp(),
    );
  }
}

class MarsolApp extends StatefulWidget {
  static const String id = "MarsolApp";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarsolAppState();
  }
}

// return BottomNavigationBar(
// unselectedItemColor: Colors.blue,
// backgroundColor: Colors.white,
// items: [
// BottomNavigationBarItem(
// title: Text("title"),
// icon: Icon(LineIcons.map),
// ),
// BottomNavigationBarItem(
// title: Text("title"),
// icon: Icon(LineIcons.map),
// ),
// BottomNavigationBarItem(
// title: Text("title"),
// icon: Icon(LineIcons.map),
// ),
// BottomNavigationBarItem(
// title: Text("title"),
// icon: Icon(LineIcons.map),
// ),
// ],
// );
const String BASEURL = "https://balqes.com";
const String RESTAPI = "wp-json/wc/v3";
const String QUERYKEYWORD = "orders";
const String consumerKey = "ck_115be05d2cb9f5c12b0fbd19737766591bcdac9f";
const String consumerSecret = "cs_1c20e101601d6e169b7ba170f01919108c6311ed";

class _MarsolAppState extends State<MarsolApp> {
  /// =============================================================
  // images
  final imageList = [
    "assets/images/marsol_app/Layer 1.png",
    "assets/images/marsol_app/Layer 222.png",
    "assets/images/marsol_app/Layer 2 Frame.png",
  ];
  int _current = 0;

  List<WooProduct> products = [];
  List<WooProduct> featuredProducts = [];

  /// Using woocommerce Plugin :
  getProducts() async {
    print(" getProducts Called :");
    products = await WooCommerceApi.getProductsWoo();
    return products;
  }

  /// Using woocommerce_api Plugin :
  // Future getProducts() async {
  //   // Initialize the API
  //   WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
  //       url: BASEURL, consumerKey: consumerKey, consumerSecret: consumerSecret);
  //
  //   // Get data using the "products" endpoint
  //   var products = await wooCommerceAPI.getAsync("products?per_page=1");
  //   return products;
  //
  // }

  /// Using Http Package :
  // getProducts() async {
  //   // products = await WooCommerceApi.woocommerce.getProducts();
  //   products = await WooCommerceApi.woocommerce.getProducts();
  //   // List<User>  s = await WooCommerceApi.getUsers();
  //   // var s = await WooCommerceApi.getGoogle();
  //   setState(() {});
  //   // print(" products Count : ${s.length}");
  // }

  /// ==============================================================

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final width = MediaQuery.of(context).size.width;
    var resturants2 = Provider.of<Data>(context).resturants2;

    var colors = [Colors.blueGrey];
    // final width = 200.0;
    return Scaffold(
      appBar: MarsolAppBar(context),
      bottomNavigationBar: MarsolNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.withOpacity(0.8),
        onPressed: () async {
          // products = await WooCommerceApi.getProductsWoo();
         products  =  await getProducts();
         setState(() {
           return products;
         });
        },
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.green.withOpacity(0.8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.yellow.withOpacity(0.5),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/marsol_app/Logo.png",
                    scale: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        children: [
          // Image slider

          Stack(
            children: [
              Container(
                child: CarouselSlider(
                  items: imageList.map((e) {
                    return Image.asset(e);
                  }).toList(),
                  options: CarouselOptions(
                    height: 150.0,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, next) {
                      setState(() {
                        _current = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              Positioned(
                bottom: -5,
                // right: width / 2,
                left: width / 2 - 10,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.map((e) {
                      int index = imageList.indexOf(e);
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index ? Colors.white : Colors.grey,
                        ),
                      );
                    }).toList()),
              )
            ],
          ),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Directionality(textDirection: TextDirection.rtl, child: Text("أشهر المواقع من حولك :")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.teal,
                  height: 140.0,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // itemCount: 10,
                    // itemBuilder: (BuildContext context, int index) {
                    children: [
                      CardRow(resturants2[0], context, "width", width),
                      CardRow(resturants2[1], context, "width", width),
                      CardRow(resturants2[2], context, "width", width),
                      CardRow(resturants2[3], context, "width", width),
                    ],
                    // },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Directionality(textDirection: TextDirection.rtl, child: Text("الخدمات الأكثر طلباً:")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors. black.withOpacity(0.5),

                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  height: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// Titles
                      Expanded(
                        child: Container(
                          child: buildGridView3(width, resturants2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors. black.withOpacity(0.5),

                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  height: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// Titles
                      Expanded(
                        child: Container(
                          child: buildGridView4(width, products),
                        ),
                      ),
                      // FutureBuilder(
                      //   future: getProducts(),
                      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //     if (snapshot.hasData) {
                      //       // Create a list of products
                      //       return ListView.builder(
                      //         scrollDirection: Axis.horizontal,
                      //         itemCount: snapshot.data.length,
                      //         itemBuilder: (BuildContext context, int index) {
                      //           return ListTile(
                      //             leading: CircleAvatar(
                      //               child:
                      //               Image.network(snapshot.data[index]["images"][0]["src"]),
                      //             ),
                      //             title: Text(snapshot.data[index]["name"]),
                      //             subtitle:
                      //             Text("Buy now for \$ " + snapshot.data[index]["price"]),
                      //           );
                      //         },
                      //       );
                      //     }
                      //
                      //     // Show a circular progress indicator while loading products
                      //     return Center(
                      //       child: CircularProgressIndicator(),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGridView3(width, resturants2) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4,

      padding: EdgeInsets.symmetric(horizontal: 0.0),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,

      children: [
        CardRow2(resturants2[0], context, "assets/images/marsol_app/cake.jpg", width, mCatNames2[0]),
        CardRow2(resturants2[1], context, "assets/images/marsol_app/cake.jpg", width, mCatNames2[1]),
        CardRow2(resturants2[2], context, "assets/images/marsol_app/cake.jpg", width, mCatNames2[2]),
        CardRow2(resturants2[3], context, "assets/images/marsol_app/cake.jpg", width, mCatNames2[3]),
      ],
      // },
    );
  }

  Widget buildGridView4(width, List<WooProduct> products) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      // color: Colors.black54,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 0.0),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,

        itemCount: products.length,

        itemBuilder: (BuildContext context, int index) {
          return CardRow3(
            product: products[index],
          );
        },

        // },
      ),
    );
  }

  Widget MarsolAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(
                children: [
                  IconButton(
                    color: Colors.black45,
                    icon: Icon(Icons.search),
                  ),
                  Expanded(
                    child: Text(
                      "إبحث عن مطعم , كوفي او أي مكان",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      child: Image.asset(
                        "assets/images/marsol_app/steering_wheel.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget MarsolNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      child: Container(
        height: 69,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => print(""),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.userAlt),
                      Text("صفحتي"),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => print(""),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.solidBell),
                      Text("التنبيهات"),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => print(""),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.shippingFast),
                      Text("الطلبات"),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () => print(""),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.storeAlt),
                      // Icon(LineIcons.),
                      Text("المتاجر"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  Resturant resturant;
  var context, imagePath, width;

  CardRow(this.resturant, this.context, this.imagePath, this.width);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Card(
        child: Column(
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(
                          "${resturant.imageUrl}",
// height: 300,
// width: 300,
                          scale: 3,
                        ),
                      ),
                      Container(
                        color: Colors.black12,
                        height: 11,
                      ),

                      /// Rating
                      Container(
                        height: 40,
                        child: Center(
                          child: Text.rich(
                            TextSpan(children: <InlineSpan>[
                              WidgetSpan(
                                child: Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.yellow,
                                ),
                              ),
                              TextSpan(text: " ${resturant.rating}"),
                            ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "${resturant.title}",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
// width: width,
//                             color: Colors.blue,
                            child: Text(
                              "${resturant.type}",
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          // color: Colors.red,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "خصم 30%",
                                style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${resturant.rating}",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardRow2 extends StatelessWidget {
  Resturant resturant;
  Cat cat;
  var context, imagePath, width;

  CardRow2(
    this.resturant,
    this.context,
    this.imagePath,
    this.width,
    this.cat,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  decoration: new BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: new DecorationImage(
                      image: new AssetImage("${imagePath}"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    height: 25,
                    // color: Colors.black54,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.6),
                          spreadRadius: 10,
                          blurRadius: 50,
                          offset: Offset(0, -11), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Container(
                  decoration: new BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "${cat.name}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardRow3 extends StatelessWidget {
  WooProduct product;
  int index;

  CardRow3({this.product});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2.7;
    double cardWidth = MediaQuery.of(context).size.width / 1.8;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ProductPage(product: product),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: height,
            width: cardWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26.withOpacity(0.5),
                  offset: Offset(0.0, 2.0),
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.deepPurpleAccent,
                ),
                Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.name ?? '',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                          color: Color.fromRGBO(224, 69, 10, 1),
                        ),
                        child: Text(
                          '\$${product.price ?? 0.0}',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Hero(
              tag: product.images[0].src,
              child: Image.network(
                product.images[0].src ?? '',
                height: height / 1.7,
                width: cardWidth / 1.4,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
