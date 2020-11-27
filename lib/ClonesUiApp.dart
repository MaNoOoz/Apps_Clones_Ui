import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ui_clones/Constants.dart';
import 'package:ui_clones/resturants_ui_app/resturants_ui_app.dart';

import 'amazon_app/AmazonApp.dart';
import 'hangerstation_app/HnagerApp.dart';
import 'marso_app/main.dart';
import 'noon_app/NoonApp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AmazonApp.id: (context) => AmazonApp(),
        NoonApp.id: (context) => NoonApp(),
        HangerApp.id: (context) => HangerApp(),
        MarsolApp.id: (context) => MarsolApp(),
        RestaurantsApp.id: (context) => RestaurantsApp(),
        // // ChatListScreen.id: (context) => ChatListScreen(),
        // ChatScreen.id: (context) => ChatScreen(),
        // FavoriteScreen.id: (context) => FavoriteScreen(),
        // HomeScreen.id: (context) => HomeScreen(),
        // ProfileScreen.id: (context) => ProfileScreen(),
        // SignupScreen.id: (context) => SignupScreen(),
        // CreatePostScreen.id: (context) => CreatePostScreen(),
        // Location_Pickup.id: (context) => Location_Pickup(),
        // FeedScreen.id: (context) => FeedScreen(),
        // Edit_Heba_Screen.id: (context) => Edit_Heba_Screen(),
//        MapScreen.id: (context) => MapScreen(
//                  context: context,
//                ),
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
        title: Text("Yaman Apps"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () {
            ///todo
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              ///todo
            },
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
      child: ListTile(
        onTap: () {
          if (AppName.isNotEmpty) {
            Navigator.pushNamed(context, AppsUiPath);
          } else {
            // log("Cart items : ${cartitems.length}");
          }
        },
        leading: Container(
          child: CircleAvatar(
            child: Image.asset(
              AppImage,
              scale: 10,
            ),
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
