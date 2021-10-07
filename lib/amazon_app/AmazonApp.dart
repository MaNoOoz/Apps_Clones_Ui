import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_clones/amazon_app/screens/CartScreen.dart';
import 'package:ui_clones/amazon_app/screens/ProductDetails.dart';
import 'package:ui_clones/amazon_app/widgets/CustomTabBar.dart';
import 'package:ui_clones/amazon_app/widgets/widgets.dart';

import 'home_screen.dart';
import 'models.dart';

void main() => runApp(AmazonApp());

class AmazonApp extends StatefulWidget {
  static const String id = "AmazonApp";

  @override
  _AmazonAppState createState() => new _AmazonAppState();
}

class _AmazonAppState extends State<AmazonApp> {
  var bottomSelectedIndex = 0;
  PageController? _pageController;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var staticList = <Product>[];

  @override
  void initState() {
    super.initState();
    staticList = Provider.of<Data>(context, listen: false).products;
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100), child: AmazonAppBar()
        ,
      ),
      bottomNavigationBar: bottomNav(
          bottomTapped: bottomTapped,
          bottomSelectedIndex: bottomSelectedIndex,
          pageController: pageController),
      body: buildPageView(),
    );
//          onClick: ()=>print("Flutter Egypt"),
//          loaderColor: Colors.red
  }

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

// GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

// var message = 'Made with ${Emojis.redHeart} by MaNoOoz.';

}
