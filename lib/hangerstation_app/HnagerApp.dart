import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_clones/amazon_app/models.dart';
import 'package:ui_clones/hangerstation_app/Main_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final appBarTheme = Theme.of(context).appBarTheme;
    // final theme = Theme.of(context);
    // final iconTheme = Theme.of(context).iconTheme;
    return MaterialApp(
      home: HangerApp(),
      // theme: ThemeData(
      //   appBarTheme: theme.appBarTheme.copyWith(
      //     brightness: Brightness.light,
      //     color: Color(0xFFFFD700),
      //     iconTheme: iconTheme.copyWith(
      //       color: Color(0xFFFFD700),
      //     ),
      //   ),
      // ),
    );
  }
}

class HangerApp extends StatefulWidget {
  static const String id = "HangerStationApp";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HangerAppState();
  }
}

class _HangerAppState extends State<HangerApp> {
  int _currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var staticList = <Resturant>[];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final width = MediaQuery.of(context).size.width;

    // final width = 200.0;
    return Scaffold(
      bottomNavigationBar: mBottomNav(),
      body: SafeArea(
        child: ListView(
          children: [
            HangerAppBar(width),
            MainPage('assets/images/hanger_app/food.png'),
            MainPage('assets/images/hanger_app/Layer 6 Frame.png'),
          ],
        ),
      ),
    );
  }

  Container HangerAppBar(double width) {
    return Container(
      height: 140,
      // color: Colors.red,

      child: Stack(children: [
        Container(
          height: 100,
          color: Colors.teal,
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFFFD700),
            centerTitle: false,
            title: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Container(
                // height: 100,
                // width: 100,
                child: Image.asset(
                  "assets/images/hanger_app/hanger.png",
                  // color: Color(0xFFF7CC33),
                  // colorBlendMode: BlendMode.hue,
                  scale: 1.9,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 70,
          // alignment: AlignmentDirectional.bottomStart,
          child: Container(
            width: width,
            child: Card(
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () => print("Ok")),
                  Expanded(
                      flex: 2,
                      child: Directionality(
                          textDirection: TextDirection.rtl, child: Text("التوصيل إلى الريان"))),
                  IconButton(icon: Icon(Icons.add_location), onPressed: () => print("Ok")),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Widget mBottomNav() {
    return CupertinoTabBar(
      iconSize: 22,
      //          key: key,
      inactiveColor: Colors.grey,
      //      border: Border.all(color: Colors.grey, width: 1),
      currentIndex: _currentTab,
      onTap: (int index) {
        if (index == 2) {
          //            openDialog();
        }
        setState(() {
          _currentTab = index;
        });
      },
      activeColor: Colors.brown[800]!.withOpacity(0.9),

      items: [
        BottomNavigationBarItem(
          title: Text(
            'المزيد',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: Icon(
            Icons.more, //              color: Colors.blue,
            // size: 28,
          ),
          icon: Icon(
            Icons.more, //              color: Colors.blue,
          ),
        ),

        BottomNavigationBarItem(
          title: Text(
            'العروض',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: ImageIcon(
            AssetImage('assets/images/noon_app/sale.png'),
            size: 28,
          ),

          //          icon: Icon(IconData(0xe800, fontFamily: "dealfont", fontPackage: "dealfont")),
          icon: ImageIcon(
            AssetImage('assets/images/noon_app/sale.png'),
            color: Colors.blue,
          ),
        ),

        BottomNavigationBarItem(
          title: Text(
            'طلباتي',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: Icon(
            Icons.article,
            size: 28,
          ),
          icon: Icon(
            Icons.article,
            //              color: Colors.amber,
          ),
        ),

        BottomNavigationBarItem(
          title: Text(
            'الرئيسية',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: Icon(
            FontAwesomeIcons.houseUser,
            size: 28,
          ),
          icon: Icon(
            FontAwesomeIcons.houseUser,
            //              color: Colors.green,
          ),
        ),

        // BottomNavigationBarItem(
        //   title: Text(
        //     'Cart',
        //     style: TextStyle(color: Colors.black45),
        //   ),
        //   activeIcon: Icon(
        //     Icons.shopping_cart,
        //     size: 28,
        //   ),
        //   icon: Icon(
        //     Icons.shopping_cart,
        //     //              color: Colors.deepOrangeAccent,
        //   ),
        // ),
      ],
    );
  }
}
