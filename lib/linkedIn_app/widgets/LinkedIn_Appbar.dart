import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../Constants.dart';

class LinkedInAppbar extends StatelessWidget {
  const LinkedInAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.white,
            /* set Status bar color in Android devices. */
            statusBarIconBrightness: Brightness.dark,
            /* set Status bar icons color in Android devices.*/
            statusBarBrightness:
                Brightness.dark) /* set Status bar icon color in iOS. */
        );
    return SafeArea(
      child: Container(
        height: 50,
        color: Colors.white,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                // color: Colors.red,
              ),
              // image
              Center(
                child: Container(
                  height: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/me.jpg"),
                    // child: Image.asset("assets/images/me.jpg"),
                  ),
                ),
              ),

              Container(
                width: 10,
                // color: Colors.red,

                // color: Colors.blue,
              ),
              // search
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.blue,
                  height: 40,
                  //
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.black45.withOpacity(0.1)
                  ),
                  child: Center(
                    child: TextFormField(
                      decoration: textFieldDecorationCircle(
                          hint: "",

                          lable: 'Search',
                          style: fontStyle.copyWith(
                            color: Color(0xFFEFF2F7),
                          ),
                          suffixIcon: Icon(CupertinoIcons.qrcode),
                          prefixIcon: Icon(Icons.search)),
                    ),
                  ),
                ),
              ),

              Container(
                width: 10,
                // color: Colors.red,
              ),
              // icon
              Center(
                child: Container(
                  // color: Colors.amber,

                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Container(
                width: 10,
                // color: Colors.red,

                // color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
