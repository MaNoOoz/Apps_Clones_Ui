import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Helpers.dart';
import 'home_screen.dart';

// void main() => runApp(splashScreen());

class AmazonApp extends StatefulWidget {
  static const String id = "AmazonApp";

  @override
  _AmazonAppState createState() => new _AmazonAppState();
}

class _AmazonAppState extends State<AmazonApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 6,
        navigateAfterSeconds: new MyApp(),
        title: new Text(
          'Welcome To Fake Amazon',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: new Image.asset(Res.LOGO_BLACK),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
//          onClick: ()=>print("Flutter Egypt"),
//          loaderColor: Colors.red
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
              color: Colors.black,
            ),
        textTheme: GoogleFonts.tajawalTextTheme(textTheme),
      ),
      home: Directionality(textDirection: TextDirection.rtl, child: HomeScreen()),
    );
  }
}
