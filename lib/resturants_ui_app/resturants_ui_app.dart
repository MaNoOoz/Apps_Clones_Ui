




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';
import 'details_page.dart';

class RestaurantsApp extends StatefulWidget {
  static const String id = "RestaurantsApp";
  Key key;

  RestaurantsApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _resturants_ui_app();
  }
}

class _resturants_ui_app extends State<RestaurantsApp>  {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorConstants.primaryColor,
        statusBarIconBrightness: Brightness.dark
    ));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBottomPart(),
          _buildTopPart(),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: ColorConstants.primaryColor),
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(),));
            },
            child: Text(
              'البدء',
              style: GoogleFonts.cairo(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopPart() {
    return Positioned.fill(
      bottom: 70,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Image.asset('assets/images/delivery-boy.png'),
              // Image.asset("${ImagesConstants.s4}"),
              Image.asset("assets/images/resturants_ui_app/images/source.gif"),

              Text(
                'توصيل سريع جداً',
                style: GoogleFonts.cairo(
                    fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'إطلب من مطعمك المفضل الآن '
                    '\n'
                    'وإستمتع بالتوصيل السريع',                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

