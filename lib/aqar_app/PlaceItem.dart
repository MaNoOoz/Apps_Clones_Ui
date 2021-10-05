import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ui_clones/amazon_app/models.dart';

class PlaceItem extends StatelessWidget {
  final Place restaurant;
  final  distance;

  const PlaceItem({Key key, this.restaurant,this.distance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 200,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Column(
            children: <Widget>[
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurant.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurant.type,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurant.Image,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ' ${distance} KM',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),

            ],
          ),
          Spacer(),
          Container(
            color: Colors.white,
            child: Image(
              image: AssetImage(
                  "assets/images/resturants_ui_app/images/donats.png"),
              height: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}
