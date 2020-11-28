import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_images_slider/flutter_images_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// void main() {
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NoonApp();
  }
}

const primaryColor = const Color(0xFFFFAC00);
const statusBarColor = Colors.white;
const appBarColor = Colors.white;
const scaffoldColor = Colors.white;

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: primaryColor,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  fontFamily: "icoMoon",
  primarySwatch: Colors.amber,
  primaryColor: Colors.orangeAccent[400],
);

final String Url =
    'https://k.nooncdn.com/s/app/2019/noon-bigalog/1ce58225ba826a0ade2228e184b6d742292c530f/static/images/noon_logo_black_arabic.svg';
final String Urlenglish = 'assets/images/noon_app/noon.png';
final String Url1 =
    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/ar_cat-module-03.png';
final List<String> imgList = [
  'https://k.nooncdn.com/cms/pages/20200415/f23a2c3cf2cb9029dfb131bc0fbe93e1/en_banner-01.png',
  'https://k.nooncdn.com/cms/pages/20200325/a0f6a810cfe3c2287d8173e572e2c63c/en_hero-banner-extra-ramadan.jpg',
  'https://k.nooncdn.com/cms/pages/20200419/3c3a094cea4ecf8ea33cd9b9b4093f06/en_banner-01.jpg',
  'https://k.nooncdn.com/cms/pages/20200419/d0aa149e2b1d8c5d644d15a9e5b97816/en_banner-01-ksa.jpg',
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class NoonApp extends StatefulWidget {
  static const String id = "NoonApp";
  Key key;

  NoonApp({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoonAppState();
  }
}

class _NoonAppState extends State<NoonApp> {
  int _current;
  int _currentTab = 0;
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    //         statusBarColor: Colors.white.withOpacity(0.9),
    //         /* set Status bar color in Android devices. */
    //         statusBarIconBrightness: Brightness.dark,
    //         /* set Status bar icons color in Android devices.*/
    //         statusBarBrightness: Brightness.light) /* set Status bar icon color in iOS. */);

    return MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      home: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          bottomNavigationBar: noonBottomNav(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: SafeArea(
              child: Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Urlenglish,
                        ),
                      ),
                    ),
                    Search(),
                  ],
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                header(),
                Container(
                  color: Colors.grey[200],
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Recomended For You",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: "ca"),
                      ),
                    ),
                  ),
                ),
                body(),
                footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Search() {
    return Expanded(
      flex: 9,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 5),
        child: Container(
          height: 40,
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: TextField(
            onChanged: (_) {
              if (_.isNotEmpty) {
                setState(() {});
              }
            },
            decoration: InputDecoration(
              hintText: "What Are You Looking For ?",
              hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: "IcoMoon",
                  color: Colors.grey.withOpacity(0.9),
                  textBaseline: TextBaseline.ideographic),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          width: screenwidth,
          color: Colors.white,
          child: ImagesSlider(
            autoPlay: true,
            viewportFraction: 2.0,
            aspectRatio: 2.0,
            distortion: false,
            indicatorColor: Colors.grey,
            align: IndicatorAlign.bottom,
            indicatorWidth: 1,
            updateCallback: (i) {
              setState(() {
                _current = i;
              });
            },
            items: map<Widget>(imgList, (index, i) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(i, scale: 2.5),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              );
            }),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.center,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            color: Colors.brown[200],
            child: ListView(
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-02.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-03.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-04.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-05.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-06.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-08.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-07.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-10.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200328/b45d91889efe7dfa6788b75b43bd26c3/en_cat-module-11.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200415/bdd336ac2522373df98a74c00d995599/en_mb-cat-module-14.png'),
                Image.network(
                    'https://k.nooncdn.com/cms/pages/20200414/c1e6b0eab70af60fc0b022984d56f016/en_mb-cat-module-13.png'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget body() {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.width;
    var a;
    return Container(
      height: 300,
      width: screenwidth,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.all(1),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            CardItem('assets/images/noon_app/a1.jpg', "12"),
            CardItem('assets/images/noon_app/a2.jpg', "12"),
            CardItem('assets/images/noon_app/a3.jpg', "12"),
            CardItem('assets/images/noon_app/a5.jpg', "12"),
            CardItem('assets/images/noon_app/a7.jpg', "12"),
            CardItem('assets/images/noon_app/a6.jpg', "12"),
            CardItem('assets/images/noon_app/a8.jpg', "12"),
            CardItem('assets/images/noon_app/z1.jpg', "12"),
          ],
        ),
      ),
    );
  }

  Widget CardItem(String imagePath, String price) {
    return Container(
      height: 300,
      width: 200,
      color: Colors.white30,
      child: Card(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        child: IconButton(
                          iconSize: 16,
                          icon: Icon(
                            FontAwesomeIcons.heart,
                            color: Colors.black38,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 135,
                  child: Image.asset(
                    '$imagePath',
                    fit: BoxFit.none,
                    scale: 2,
                    width: 200,
                    height: 140,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'sdasdas asd asd asd asd     sdasdasd ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'SAR',
                          style: TextStyle(fontWeight: FontWeight.w100),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '${price}.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            'assets/images/noon_app/express.png',
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget footer() {
    return Container();
  }

  Widget noonBottomNav() {
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
      activeColor: Colors.amber[400].withOpacity(0.5),

      items: [
        BottomNavigationBarItem(
          title: Text(
            'Home',
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
        BottomNavigationBarItem(
          title: Text(
            'Categories',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: Icon(
            Icons.category,
            size: 28,
          ),
          icon: Icon(
            Icons.category,
            //              color: Colors.amber,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(
            'Deals',
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
            'My Account',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: Icon(
            Icons.person,
            size: 28,
          ),
          icon: Icon(
            Icons.person_outline, //              color: Colors.blue,
          ),
        ),
        BottomNavigationBarItem(
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black45),
          ),
          activeIcon: Icon(
            Icons.shopping_cart,
            size: 28,
          ),
          icon: Icon(
            Icons.shopping_cart,
            //              color: Colors.deepOrangeAccent,
          ),
        ),
      ],
    );
  }
}
