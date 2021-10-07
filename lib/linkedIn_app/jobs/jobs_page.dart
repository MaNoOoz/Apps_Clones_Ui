import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'jobs_controller.dart';

class JobsPage extends GetView<JobsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Jobs Page")
        ),
      ),
    );
  }
}
