import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ui_clones/linkedIn_app/routes/app_pages.dart';
import 'package:ui_clones/linkedIn_app/routes/app_routes.dart';
import 'package:ui_clones/linkedIn_app/themes/app_theme.dart';

void main() {

  runApp(LinkedApp());
}

class LinkedApp extends StatelessWidget {
  static const String id = "LinkedInApp";


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,

    );

  }


}
