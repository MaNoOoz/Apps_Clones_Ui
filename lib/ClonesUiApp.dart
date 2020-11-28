import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_clones/Constants.dart';
import 'package:ui_clones/resturants_ui_app/resturants_ui_app.dart';

import 'amazon_app/AmazonApp.dart';
import 'hangerstation_app/HnagerApp.dart';
import 'marso_app/MarsolApp.dart';
import 'noon_app/NoonApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final theme = Theme.of(context);
    final iconTheme = Theme.of(context).iconTheme;
    // final googleFont = GoogleFonts.cairoTextTheme(textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: theme.appBarTheme.copyWith(
          color: ColorConstants.primaryColor,
          iconTheme: iconTheme.copyWith(color: Colors.black45),
        ),
      ),
      routes: {
        AmazonApp.id: (context) => AmazonApp(),
        NoonApp.id: (context) => NoonApp(),
        HangerApp.id: (context) => HangerApp(),
        MarsolApp.id: (context) => MarsolApp(),
        RestaurantsApp.id: (context) => RestaurantsApp(),
      },
      home: HomePage(),
    );
  }
}

var AppsName = [
  Constants.AmazoneAppName,
  Constants.NoonAppName,
  Constants.HangerStationAppName,
  Constants.MarsolAppName,
  Constants.RestaurantsAppName
];
var AppsImage = [
  Constants.AmazoneLogo,
  Constants.NoonLogo,
  Constants.HangerStationLogo,
  Constants.MarsolAppLogo,
  Constants.RestaurantsAppLogo
];
var AppsUiPath = [
  Constants.AmazoneApp,
  Constants.NoonApp,
  Constants.HangerStationApp,
  Constants.MarsolApp,
  Constants.RestaurantsApp,
];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ColorConstants.primaryColor,
        title: Text(
          "Apps Ui",
          style: GoogleFonts.cairo(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.white
          ),
        ),
        centerTitle: true,
        // leading: Padding(
        //   padding: const EdgeInsets.only(bottom: 6.0,),
        //   child: Image.asset(
        //     "assets/images/myIcon.png"
        //   ),
        // ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.ac_unit),
          //   onPressed: () {
          //     ///todo
          //   },
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0,),
            child: Image.asset(
                "assets/images/myIcon.png"
            ),
          ),

        ],
      ),
      body: ListView.builder(
        itemCount: AppsName.length,
        itemBuilder: (context, index) {
          return ListRow(AppsName[index], AppsImage[index], AppsUiPath[index]);
        },
      ),
    );
  }
}

class ListRow extends StatelessWidget {
  final String AppName;
  final String AppImage;
  final String AppsUiPath;

  ListRow(this.AppName, this.AppImage, this.AppsUiPath);

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
        leading: Container(
          width: 50,
          child: Image.asset(
            AppImage,
            scale: 6,
          ),
        ),
        title: Text(
          AppName,

        ),
      ),
    );
  }
}

/// ================================================= Amazon App  ==========================================================================================

/// ================================================= Noon App  ==========================================================================================
