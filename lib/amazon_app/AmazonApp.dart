import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ui_clones/Constants.dart';
import 'package:ui_clones/amazon_app/widgets/CustomTabBar.dart';

import 'home_screen.dart';
import 'models.dart';

void main() => runApp(AmazonApp());

class bottomNav extends StatelessWidget {
  final bottomSelectedIndex;
  final PageController pageController;
  final Function bottomTapped;

  bottomNav({this.bottomSelectedIndex, this.pageController, this.bottomTapped});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(bottom: 12.0),
      color: Colors.white,
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: CustomTabBar(
            icons: navIcons,
            selectedIndex: bottomSelectedIndex,
            onTap: (int index) {
              return bottomTapped(index);
            }),
      ),
    );
  }
}

class AmazonApp extends StatefulWidget {
  static const String id = "AmazonApp";

  @override
  _AmazonAppState createState() => new _AmazonAppState();
}

class _AmazonAppState extends State<AmazonApp> {
  var bottomSelectedIndex = 0;
  PageController _pageController;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var staticList = <Product>[];

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
      log("Current Tap : $bottomSelectedIndex");
    });
  }

  void bottomTapped(int index) {
    if (this.mounted) {
      setState(() {
        if (index == 2) {
          Navigator.pushNamed(context, CartScreen.id);
        }
        // Your state change code goes here
        bottomSelectedIndex = index;
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      });
    }
  }

  PageView buildPageView() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        HomeScreen(),
        ProductDetails(),
        CartScreen(),
      ],
      onPageChanged: (int index) {
        pageChanged(index);
      },
    );
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // var message = 'Made with ${Emojis.redHeart} by MaNoOoz.';

  @override
  void initState() {
    super.initState();
    staticList = Provider.of<Data>(context, listen: false).products;
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      navigateAfterSeconds: Scaffold(
        bottomNavigationBar: bottomNav(
            bottomTapped: bottomTapped,
            bottomSelectedIndex: bottomSelectedIndex,
            pageController: pageController),
        body: buildPageView(),
      ),
      title: new Text(
        'Welcome To Fake Amazon ',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.asset(Constants.AmazoneLogo),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
//          onClick: ()=>print("Flutter Egypt"),
//          loaderColor: Colors.red
    );
  }
}
