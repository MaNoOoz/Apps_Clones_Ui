import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_clones/amazon_app/models.dart';
import 'package:ui_clones/amazon_app/screens/ProductDetails.dart';
import 'package:ui_clones/amazon_app/widgets/widgets.dart';

import 'models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _current;
  int _currentTab = 0;
  int _selectedIndex = 0;

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  var staticList = <Product>[];

  // var message = 'Made with ${Emojis.redHeart} by MaNoOoz.';

  @override
  void initState() {
    super.initState();
    staticList = Provider.of<Data>(context, listen: false).products;
  }

  @override
  Widget build(BuildContext context) {
    var mobiles = Provider.of<Data>(context).mobiles;
    var products = Provider.of<Data>(context).products;
    var toys = Provider.of<Data>(context).toys;

    return DefaultTabController(
      length: catIcons.length,
      child: Scaffold(
        key: _drawerKey,
        backgroundColor: Colors.white,
        // appBar: AmazonAppBar(),
        body: Contentbody(mobiles, toys, products),
      ),
    );
  }

  Widget Contentbody(mobiles, toys, products) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 0.0),
        // CatList(
        //   icons: mIcons,
        //   catNames: mCatNames,
        //   colors: mColors,
        // ),
        _Slider(),
        ListTile(
          title: Text(
            "عرض اليوم",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ProductItem(products),
        Image.asset(offersImages2[0]),
        Divider(
          height: 5,
        ),
        Image.asset(offersImages2[1]),
        Divider(
          height: 5,
        ),
        Image.asset(offersImages2[2]),
        Divider(
          height: 5,
        ),
        Image.asset(offersImages2[3]),
        ProductList(
          title: 'عروض اليوم',
          products: mobiles,
        ),
        ProductList(
          title: 'آلعاب آطفال',
          products: toys,
        ),
        ProductList(
          title: 'الموبايلات',
          products: mobiles,
        ),
//          ProductCarousel(
//            title: 'Popular Books',
//            products: books,
//          ),
      ],
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text("Ashish Rawat"),
//              accountEmail: Text("ashishrawat2911@gmail.com"),
//              currentAccountPicture: CircleAvat ar(
//                backgroundColor:
//                    Theme.of(context).platform == TargetPlatform.iOS
//                        ? Colors.blue
//                        : Colors.white,
//                child: Text(
//                  "A",
//                  style: TextStyle(fontSize: 40.0),
//                ),
//              ),
//            ),
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("assets/images/amazon_app/man.png"),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' مرحباً.  MaNoOoz',
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                )),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
          ListTile(
            title: Text('الحساب'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('المشتريات'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('القوائم'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),

          Container(
            color: Colors.black12,
            height: 5,
          ),

          ListTile(
            title: Text('الصفحة الرئيسية'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('تسوق حسب القسم'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('عروض اليوم'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          Container(
            color: Colors.black12,
            height: 5,
          ),

          ListTile(
            title: Text(
              'المساعدة والإعدادات',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('حسابك'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('العربية'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text(' المملكة العربية السعودية'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),

          ListTile(
            title: Text('خدمة العملاء'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),

          ListTile(
            title: Text('تسجيل الدخول'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  Widget _Slider() {
    var screenwidth = MediaQuery.of(context).size.width;

    // return Align(
    //   child: Container(
    //     child: ImagesSlider(
    //       autoPlay: true,
    //       viewportFraction: 2.0,
    //       aspectRatio: 2.0,
    //       distortion: false,
    //       indicatorColor: Colors.grey,
    //       align: IndicatorAlign.bottom,
    //       indicatorWidth: 1,
    //       updateCallback: (i) {
    //         setState(() {
    //           _current = i;
    //         });
    //       },
//
//           /// NetWork
// //            items: map<Widget>(imgList, (index, i) {
// //              return Container(
// //                decoration: BoxDecoration(
// //                  image: DecorationImage(
// //                    image: NetworkImage(i, scale: 2.5),
// //                    fit: BoxFit.scaleDown,
// //                  ),
// //                ),
// //              );
// //            }),
//
//           /// static
//           items: maping<Widget>(imgList, (index, i) {
//             return Container(
//                 child: Image.asset(
//               i,
//               width: screenwidth,
//               scale: 1,
//             ));
//           }),
//         ),
//       ),
//     );
    return Align(
      child: Container(
        child: CarouselSlider(
          items: imgList.map((e) {
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
    );
  }

  List<T?> maping<T>(List list, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
