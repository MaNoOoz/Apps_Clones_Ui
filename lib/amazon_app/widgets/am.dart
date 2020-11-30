import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class AmazonAppBar  extends StatelessWidget implements PreferredSizeWidget{

  @override

  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 0.0),
      width: MediaQuery.of(context).size.width - 10,
      // height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: GradientColors.mojito,
        ),
      ),
      // color: Colors.blueGrey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Container(height: 50, child: Search()),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0,bottom: 5),
                child: Directionality(textDirection: TextDirection.rtl,child: Text("التوصيل إلى عنيزة")),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class Search  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: "البحث في Amazon.sa ",
              hintStyle: GoogleFonts.cairo(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.withOpacity(0.9),
                  textBaseline: TextBaseline.ideographic),
              border: InputBorder.none,
              prefixIcon: Icon(
                LineIcons.search,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




