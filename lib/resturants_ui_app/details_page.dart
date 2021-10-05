import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_clones/resturants_ui_app/widgets/food_tile.dart';

import '../Constants.dart';
import 'models/category.dart';
import 'models/food_item.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Category> data = [
    Category(
      id: 1,
      name: 'رائج',
      foodList: <FoodItem>[
        FoodItem(
            id: 1,
            name: 'شاورما لحم ',
            price: 5.99,
            imagePath: 'assets/images/resturants_ui_app/images/shawrma.png'),
        FoodItem(
            id: 2,
            name: 'شاورما دجاج',
            price: 6.99,
            imagePath: 'assets/images/resturants_ui_app/images/shawrma.png'),
      ],
    ),
    Category(
      id: 2,
      name: 'وجبات اللحم',
      foodList: <FoodItem>[
        FoodItem(
            id: 3,
            name: 'برجر لحم ',
            price: 10.99,
            imagePath: 'assets/images/resturants_ui_app/images/hamburger.png'),
        FoodItem(
            id: 4,
            name: 'بيج ماك',
            price: 12.99,
            imagePath: 'assets/images/resturants_ui_app/images/hamburger.png'),
      ],
    ),
    Category(
      id: 3,
      name: 'هوت دوج',
      foodList: <FoodItem>[
        FoodItem(
            id: 1,
            name: 'هوت دوج حراق',
            price: 5.99,
            imagePath: 'assets/images/resturants_ui_app/images/hotdog2.png'),
        FoodItem(
            id: 5,
            name: 'هوت دوج عادي',
            price: 4.99,
            imagePath: 'assets/images/resturants_ui_app/images/hotdog.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'وجبات الدجاج',
      foodList: <FoodItem>[
        FoodItem(
            id: 6,
            name: 'برجر دجاج عالفحم ',
            price: 5.99,
            imagePath: 'assets/images/resturants_ui_app/images/burger.png'),
        FoodItem(
            id: 7,
            name: 'برجر دجاج مشوي',
            price: 7.99,
            imagePath: 'assets/images/resturants_ui_app/images/burger.png'),
        FoodItem(
            id: 8,
            name: 'برجر دجاج مشوي إيطالي',
            price: 9.99,
            imagePath: 'assets/images/resturants_ui_app/images/burger.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'بيتزا',
      foodList: <FoodItem>[
        FoodItem(
            id: 9,
            name: 'مارجريتا',
            price: 15.99,
            imagePath: 'assets/images/resturants_ui_app/images/pizza-1.png'),
        FoodItem(
            id: 10,
            name: 'ببروني',
            price: 18.99,
            imagePath: 'assets/images/resturants_ui_app/images/pizza-2.png'),
        FoodItem(
            id: 11,
            name: 'خضار',
            price: 16.99,
            imagePath: 'assets/images/resturants_ui_app/images/pizza-2.png'),
        FoodItem(
            id: 12,
            name: 'دجاج مشوي',
            price: 22.99,
            imagePath: 'assets/images/resturants_ui_app/images/pizza-1.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'حلويات',
      foodList: <FoodItem>[
        FoodItem(
            id: 9,
            name: 'دونات',
            price: 15.99,
            imagePath: 'assets/images/resturants_ui_app/images/donats.png'),
        FoodItem(
            id: 9,
            name: 'آيس كريم',
            price: 15.99,
            imagePath: 'assets/images/resturants_ui_app/images/ic.png'),
        FoodItem(
            id: 9,
            name: 'بانكيك',
            price: 15.99,
            imagePath: 'assets/images/resturants_ui_app/images/bk.png'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "~ الوجبات ~",
          style: GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorConstants.primaryColor,
      ),
      // backgroundColor: Color(0xffF79955),
      backgroundColor: ColorConstants.primaryColor,
      // backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              // "${ImagesConstants.s}",
              // "${ImagesConstants.s1}",
              "assets/images/resturants_ui_app/images/f.gif",
              // color: Colors.red,
              height: 150,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    _buildIntro(),
                    Expanded(
                      child: _buildMenu(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'الوجبات',
                style: GoogleFonts.cairo(
                    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'نعمل لخدمتكم منذ عام 2000 ',
              style: GoogleFonts.cairo(
                  fontSize: 15, fontWeight: FontWeight.w600, color: ColorConstants.primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      child: DefaultTabController(
        length: data.length,
        child: Column(
          children: <Widget>[
            Container(
            color: ColorConstants.primaryColor

            ,child: _buildTabBar()),
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTabBar() {
    return TabBar(
      labelColor: Colors.white,
      isScrollable: true,
      indicatorColor: ColorConstants.primaryColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: GoogleFonts.cairo(fontWeight: FontWeight.w600),
      tabs: List.generate(
        data.length,
        (index) => Tab(
          text: data[index].name,
        ),
      ),
    );
  }

  _buildTabBarView() {
    return Container(
      child: TabBarView(
        children: List.generate(
          data.length,
          (index) {
            ///TabBarView children length = Number of categories
            ///Each category have foodList (ListView)
            return Container(
              child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, foodIndex) {
                    return FoodTile(
                      foodItem: data[index].foodList[foodIndex],
                    );
                  },
                  separatorBuilder: (context, foodIndex) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: data[index].foodList.length),
            );
          },
        ),
      ),
    );
  }
}
