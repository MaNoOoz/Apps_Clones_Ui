import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_clones/linkedIn_app/jobs/jobs_page.dart';
import 'package:ui_clones/linkedIn_app/screens/alerts/alerts_page.dart';
import 'package:ui_clones/linkedIn_app/screens/home/home_page.dart';
import 'package:ui_clones/linkedIn_app/screens/mynetwork/feed_page.dart';
import 'package:ui_clones/linkedIn_app/screens/profile/profile_page.dart';
import 'package:ui_clones/linkedIn_app/widgets/LinkedIn_Appbar.dart';

import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(100), child: LinkedInAppbar()),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                FeedPage(),
                AlertsPage(),
                ProfilePage(),
                JobsPage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person_2_alt,
                label: 'My Network',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.add_circled_solid,
                label: 'New Post',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.bell,
                label: 'Notifications',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.bag_fill,
                label: 'Jobs',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
