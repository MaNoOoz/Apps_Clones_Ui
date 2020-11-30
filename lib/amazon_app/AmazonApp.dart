import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:ui_clones/Constants.dart';

import 'home_screen.dart';
import 'models.dart';

// void main() => runApp(AmazonApp());

class AmazonApp extends StatefulWidget {
  static const String id = "AmazonApp";

  @override
  _AmazonAppState createState() => new _AmazonAppState();
}

class _AmazonAppState extends State<AmazonApp> {
  @override
  Widget build(BuildContext context) {

    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new HomeScreen(),
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
