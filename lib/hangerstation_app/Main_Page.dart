import 'package:flutter/material.dart';
import 'package:ui_clones/hangerstation_app/resturantsPage.dart';

class MainPage extends StatelessWidget {
  var imagePath;

  MainPage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 250,
      child: Card(
        color: Color(0xFFFFD700),
        child: Stack(
          children: [
            Align(
              // alignment: AlignmentDirectional.center,
              child: Container(
                child: Image.asset(
                  "$imagePath",
                  // height: 300,
                  // width: 300,
                  scale: 0.6,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                height: 100,
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
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 15,
                      blurRadius: 111,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "مطاعم ومتاجر \n "
                    "نوصلك كل أنواع المطاعم",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width,
                    // color: Colors.blue,
                    child: RaisedButton(
                      child: Text(
                        "إطلب الحين",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      color: Color(0xFFF7CC33),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResturantsPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
