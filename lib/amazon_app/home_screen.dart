import 'dart:developer';

import 'package:emojis/emojis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_images_slider/flutter_images_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Helpers.dart';
import 'ProductList.dart';
import 'cart_screen.dart';
import 'models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current;
  int _currentTab = 0;
  var cartitems = <Product>[];
  var staticList = <Product>[];

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  var message = 'Made with ${Emojis.redHeart} by MaNoOoz.';

  Product product;

  @override
  void initState() {
    super.initState();
    staticList = products;
  }

  Widget Search() {
    return Container(
//          height: 40,
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextField(
          onChanged: (_) {
            if (_.isNotEmpty) {
              setState(() {});
            }
          },
          decoration: InputDecoration(
            hintText: "مالذي تبحث عنه ؟",
            hintStyle: GoogleFonts.tajawal(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.withOpacity(0.9),
                textBaseline: TextBaseline.ideographic),
            border: InputBorder.none,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
//      bottomNavigationBar: noonBottomNav(),

      drawer: buildDrawer(context),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          color: Colors.blueGrey[900],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              AppBar(
                /// Good Morning
                backgroundColor: Colors.blueGrey[900],
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: InkResponse(
                        onTap: () {
                          _drawerKey.currentState.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
//              Padding(
//                padding: EdgeInsets.only(right: 20.0),
//                child: InkResponse(
//                  child: Icon(
//                    Icons.arrow_forward_ios,
//                    size: 10.0,
//                    color: Colors.white,
//                  ),
//                ),
//              ),
                  ],
                ),

                title: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(Res.LOGO),
                  height: 70.0,
                ),
//      title: Text(message),
                centerTitle: true,
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: InkResponse(
                      onTap: () => print('Search'),
                      child: Icon(
                        Icons.notifications_none,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Stack(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 12.0, left: 10.0),
                        child: InkResponse(
                          onTap: () {
                            if (cartitems.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CartScreen(cartitems, product),
                                ),
                              );
                            } else {
                              log("Cart items : ${cartitems.length}");
                            }
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            size: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 1.0,
                        right: 5.0,
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              '${cartitems.length}',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(height: 40, child: Search()),
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          CatList(
            icons: mIcons,
            catNames: mCatNames,
            colors: mColors,
          ),
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
          ProductItem(0),
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
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
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
                  backgroundImage: AssetImage("assets/images/amazon_app/man.png"),
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

  Align _Slider() {
    var screenwidth = MediaQuery.of(context).size.width;

    return Align(
      child: Container(
        child: ImagesSlider(
          autoPlay: true,
          viewportFraction: 2.0,
          aspectRatio: 2.0,
          distortion: false,
          indicatorColor: Colors.grey,
          align: IndicatorAlign.bottom,
          indicatorWidth: 1,
          updateCallback: (i) {
            setState(() {
              _current = i;
            });
          },

          /// NetWork
//            items: map<Widget>(imgList, (index, i) {
//              return Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: NetworkImage(i, scale: 2.5),
//                    fit: BoxFit.scaleDown,
//                  ),
//                ),
//              );
//            }),

          /// static
          items: maping<Widget>(imgList, (index, i) {
            return Container(
                child: Image.asset(
              i,
              width: screenwidth,
              scale: 1,
            ));
          }),
        ),
      ),
    );
  }

  List<T> maping<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
//Widget noonBottomNav() {
//  return CupertinoTabBar(
//    iconSize: 22,
//    //          key: key,
//    inactiveColor: Colors.grey,
//    //      border: Border.all(color: Colors.grey, width: 1),
//    currentIndex: _currentTab,
//    onTap: (int index) {
//      if (index == 2) {
//        //            openDialog();
//      }
//      setState(() {
//        _currentTab = index;
//      });
//    },
//    activeColor: Colors.amber[400].withOpacity(0.5),
//
//    items: [
//      BottomNavigationBarItem(
//        title: Text(
//          'Home',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          FontAwesomeIcons.houseUser,
//          size: 28,
//        ),
//        icon: Icon(
//          FontAwesomeIcons.houseUser,
//          //              color: Colors.green,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'Categories',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          Icons.category,
//          size: 28,
//        ),
//        icon: Icon(
//          Icons.category,
//          //              color: Colors.amber,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'Deals',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: ImageIcon(
//          AssetImage('assets/images/amazon_app/sale.png'),
//          size: 28,
//        ),
//
//        //          icon: Icon(IconData(0xe800, fontFamily: "dealfont", fontPackage: "dealfont")),
//        icon: ImageIcon(
//          AssetImage('assets/images/amazon_app/sale.png'),
//          color: Colors.blue,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'My Account',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          Icons.person,
//          size: 28,
//        ),
//        icon: Icon(
//          Icons.person_outline, //              color: Colors.blue,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'Cart',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          Icons.shopping_cart,
//          size: 28,
//        ),
//        icon: Icon(
//          Icons.shopping_cart,
//          //              color: Colors.deepOrangeAccent,
//        ),
//      ),
//    ],
//  );
//}
