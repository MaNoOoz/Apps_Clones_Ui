import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alerts_controller.dart';

class AlertsPage extends GetView<AlertsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "Add Post Page",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
