import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_clones/Constants.dart';
import 'package:ui_clones/linkedIn_app/models/Post.dart';
import 'package:ui_clones/linkedIn_app/models/User.dart';
import 'package:ui_clones/linkedIn_app/widgets/PostCard.dart';
import 'package:ui_clones/noon_app/NoonApp.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Widget _listOfPostWidget() {
      return Container(
        child: ListView.builder(
          itemCount: POSTS.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              press: () => print("ss"),
              model: POSTS[index],
            );
          },
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: backColor,
        child: RefreshIndicator(
          onRefresh: () async {
            await 1;
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 30,
              ),
              _listOfPostWidget()
            ],
          ),
        ),
      ),
    );
  }
}
