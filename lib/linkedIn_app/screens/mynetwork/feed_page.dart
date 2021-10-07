import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'feed_controller.dart';

class FeedPage extends GetView<FeedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Feed Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
