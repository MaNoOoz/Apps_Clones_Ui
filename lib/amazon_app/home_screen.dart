import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_images_slider/flutter_images_slider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:ui_clones/amazon_app/widgets/am.dart';

import 'models.dart';
import 'widgets/CustomTabBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current;
  int _currentTab = 0;
  int _selectedIndex = 0;
  var staticList = <Product>[];

  final List<IconData> _icons = const [
    Icons.home,
    // Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.cart,
    // MdiIcons.bellOutline,
    Icons.menu,
  ];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  // var message = 'Made with ${Emojis.redHeart} by MaNoOoz.';

  @override
  void initState() {
    super.initState();
    staticList =
        Provider
            .of<Data>(context, listen: false)
            .products;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(

        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          color: Colors.white,
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) =>
                setState(() {
                  _selectedIndex = index;
                  print(index);
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CartScreen(
                              products:staticList,
                              product: staticList[0],
                            ),
                      ),
                    );
                  }
                }),
          ),
        ),
        key: _drawerKey,
        backgroundColor: Colors.white,
        appBar: AmazonAppBar(),
        body: Contentbody(),
      ),
    );
  }

  Widget Contentbody() {
    return ListView(
      children: <Widget>[
        SizedBox(height: 0.0),
        // CatList(
        //   icons: mIcons,
        //   catNames: mCatNames,
        //   colors: mColors,
        // ),
        _Slider(),
        ListTile(
          title: Text(
            "عرض اليوم",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ProductItem(0),
        Image.asset(offersImages2[0]),
        Divider(
          height: 5,
        ),
        Image.asset(offersImages2[1]),
        Divider(
          height: 5,
        ),
        Image.asset(offersImages2[2]),
        Divider(
          height: 5,
        ),
        Image.asset(offersImages2[3]),
        ProductList(
          title: 'عروض اليوم',
          products: mobiles,
        ),
        ProductList(
          title: 'آلعاب آطفال',
          products: toys,
        ),
        ProductList(
          title: 'الموبايلات',
          products: mobiles,
        ),
//          ProductCarousel(
//            title: 'Popular Books',
//            products: books,
//          ),
      ],
    );
  }


  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
//            UserAccountsDrawerHeader(
//              accountName: Text("Ashish Rawat"),
//              accountEmail: Text("ashishrawat2911@gmail.com"),
//              currentAccountPicture: CircleAvat ar(
//                backgroundColor:
//                    Theme.of(context).platform == TargetPlatform.iOS
//                        ? Colors.blue
//                        : Colors.white,
//                child: Text(
//                  "A",
//                  style: TextStyle(fontSize: 40.0),
//                ),
//              ),
//            ),
          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/amazon_app/man.png"),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' مرحباً.  MaNoOoz',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    )),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
          ListTile(
            title: Text('الحساب'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('المشتريات'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('القوائم'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),

          Container(
            color: Colors.black12,
            height: 5,
          ),

          ListTile(
            title: Text('الصفحة الرئيسية'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('تسوق حسب القسم'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('عروض اليوم'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          Container(
            color: Colors.black12,
            height: 5,
          ),

          ListTile(
            title: Text(
              'المساعدة والإعدادات',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('حسابك'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('العربية'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text(' المملكة العربية السعودية'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),

          ListTile(
            title: Text('خدمة العملاء'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),

          ListTile(
            title: Text('تسجيل الدخول'),
            onTap: () {
              Navigator.pop(context);
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  Widget _Slider() {
    var screenwidth = MediaQuery
        .of(context)
        .size
        .width;

    return Align(
      child: Container(
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

          /// NetWork
//            items: map<Widget>(imgList, (index, i) {
//              return Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: NetworkImage(i, scale: 2.5),
//                    fit: BoxFit.scaleDown,
//                  ),
//                ),
//              );
//            }),

          /// static
          items: maping<Widget>(imgList, (index, i) {
            return Container(
                child: Image.asset(
                  i,
                  width: screenwidth,
                  scale: 1,
                ));
          }),
        ),
      ),
    );
  }

  List<T> maping<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}

class CartScreen extends StatefulWidget {
  static const id = "CartScreen";
  List<Product> products;
  Product product;

  CartScreen({this.products, this.product});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> _productsInCart = <Product>[];
  int count = 1;
  double total_bill;

  @override
  void initState() {
    super.initState();
    _productsInCart = widget.products;
  }

  Widget _submitButton(BuildContext context, title) {
    var screenSize = MediaQuery
        .of(context)
        .size;

    return FlatButton(
        onPressed: () async {
          log("_cartList Size : ${_productsInCart.length}");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.amber,
        child: Container(
          width: screenSize.width - 100,
          alignment: Alignment.center,
//          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(title), color: Colors.amber,
        ));
  }

  Widget ActionsButtons(BuildContext context, title, int index, Function function) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    var _cartList = <Product>[];
    var item = widget.products;

    return FlatButton(
        onPressed: () async {
          log("_cartList Size : ${_cartList.length}");
          function();
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
            side: BorderSide(color: Colors.black, width: 0.3)),
        color: Colors.grey[200],
        child: Container(
          alignment: Alignment.center,
//          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(title),
//          color: Colors.amber,
        ));
  }

  String format(double n) {
    final fraction = n - n.toInt();
    if (fraction == 0.0) {
      return n.toString();
    }
    var twoDigitFraction = (fraction * 100).truncateToDouble().toInt();
    return '${n.toInt()}.$twoDigitFraction';
  }

  Widget total(BuildContext context, title, Product product) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    var cuurency = "  ريال ";
    var total_bill = format(product.price * count).toString();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenSize.width - 10,
        alignment: Alignment.center,
//          padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(
              " : $title",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${total_bill}",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.red[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "  $cuurency  ",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.red[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }

  _buildCartProduct(int index, BuildContext context, Product product) {
    return Column(
      children: <Widget>[
        Divider(),
        ListTile(
          contentPadding: EdgeInsets.all(10.0),
          trailing: Image(
            height: double.infinity,
            width: 100.0,
            image: AssetImage(
              _productsInCart[index].imageUrl,
            ),
            fit: BoxFit.contain,
          ),
          title: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              _productsInCart[index].name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          subtitle: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              '${(_productsInCart[index].price.toStringAsFixed(2))}' + ' ريال ',
              style: TextStyle(
                color: Colors.red[800],
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
//      trailing: Text(
//
//        '${(_productsInCart[index].price.toStringAsFixed(2))}'+
//        ' ريال ',
//        textDirection: TextDirection.rtl,
//        style: TextStyle(
//          color: Colors.red[800],
//          fontSize: 16.0,
//          fontWeight: FontWeight.bold,
//        ),
//      ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionsButtons(context, "حفظ لوقت لاحق", index, () => delete()),
                )),
            Spacer(),
            Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionsButtons(context, "حذف", index, () => delete()),
                )),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionsButtons(context, "+", index, () {
                    setState(() {
                      return count++;
                    });
                    log("COUNT : $count");
                  }),
                )),
            Divider(
              height: 5,
            ),
            Text("$count"),
            Divider(
              height: 5,
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ActionsButtons(context, "-", index, () {
                    setState(() {
                      if (count > 1) {
                        count--;
                      } else {
                        _productsInCart.remove(product);
                        setState(() {
                          count = 0;
                        });
                      }
                      return count;
                    });
                  }),
                )),
          ],
        ),
        Divider(),
      ],
    );
  }

  delete() {}

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    var product = widget.product;
    GlobalKey<ScaffoldState> _key = GlobalKey();

    return Scaffold(
      key: _key,
      appBar: AmazonAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          total(context, "  المجموع الجزئي ( ${_productsInCart.length} سلعة )  ", product),
          _submitButton(context, "إتمام عملية الشراء"),
          Container(
            height: 400,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _productsInCart.length,
              itemBuilder: (BuildContext context, int index) {
                log("${_productsInCart.length}");

                return _buildCartProduct(index, context, _productsInCart[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              'قام المستخدمون الذين اشتروا نفس السلع في عربة التسوق بشراء',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails(this.product);

  //  final DocumentSnapshot documentSnapshot;
//  final bool isMe;
//  final String userId;

//  HebaDetails({this.product, this.documentSnapshot, this.isMe, this.userId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  List<Product> _cartList = <Product>[];
  var prodList;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    prodList = Provider
        .of<Data>(context, listen: false)
        .products;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AmazonAppBar(),

      body: mDetailsPage(context, widget.product),
    );
  }

  mDetailsPage(BuildContext context, Product product) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: ListView(children: <Widget>[
          _Card(context),
        ]),
      ),
    );
  }

  Widget _Card(context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          header(),
          Body(),
          Footer(context),
        ],
      ),
    );
  }

  header() {
    double rating = 3.5;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Container(
                    color: Colors.white,
                    child: Text(
                      widget.product.name,
                      style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    ))),
            Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {},
                    starCount: 5,
                    rating: rating,
                    size: 20.0,
                    isReadOnly: true,
//                          fullRatedIconData: Icons.blur_off,
//                          halfRatedIconData: Icons.blur_on,
                    color: Colors.amber,
                    borderColor: Colors.amberAccent,
                    spacing: 0.0),
              ),
            ),
            Expanded(flex: 1, child: Container(color: Colors.white, child: Text("4.2"))),
          ],
        ),
      ),
    );
  }

  Body() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(child: Image.asset(widget.product.imageUrl)),
    );
  }

  Widget _submitButton(BuildContext context, title) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    var item = widget.product;

    return FlatButton(
        onPressed: () async {
          setState(() {
            _cartList.add(item);
            var addedHebaObject = Provider.of<Data>(context, listen: false).AddNewProduct(item);
          });
          log("prodList  : ${prodList.length}");
          log("_cartList Size : ${_cartList.length}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartScreen(products: prodList, product: item),
            ),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.amber,
        child: Container(
          width: screenSize.width - 100,
          alignment: Alignment.center,
//          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(title), color: Colors.amber,
        ));
  }

  Footer(context) {
    return Column(
      children: <Widget>[
        _submitButton(context, "BuyNow"),
        _submitButton(context, "Add To Cart"),
      ],
    );
  }
}

class ProductList extends StatelessWidget {
  final String title;
  final List<Product> products;

  ProductList({
    this.title,
    this.products,
  });

  card(int index, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(products[index]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        width: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Image(
                image: AssetImage(products[index].imageUrl),
                height: 100.0,
                width: 150.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              products[index].name,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  ' ${(products[index].price.toStringAsFixed(2))} - ${(products[index].price + 100)
                      .toStringAsFixed(2)} ريال ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
              ],
            ),
//            Container(
//              margin: EdgeInsets.only(top: 10),
//              height: 20,
//              child: FlatButton(
//                child: Container(
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Text("See all deals",
//                        style: TextStyle(color: Colors.blue,),),
//                      Icon(
//                        Icons.arrow_forward_ios, color: Colors.blue, size: 15,)
//                    ],
//                  ),
//                ),
//                onPressed: () {
//
//                },
//              ),
//            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 280.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return card(index, context);
            },
          ),
        ),
      ],
    );
  }
}

class CatList extends StatelessWidget {
  final List<IconData> icons;
  final List<Cat> catNames;
  final List<Color> colors;

  CatList({
    this.icons,
    this.catNames,
    this.colors,
  });

  _Listitem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white,
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Align(
              child: Container(
                width: 60,
                height: 60,
                child: Icon(
                  mIcons[index],
                  size: 30,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(shape: BoxShape.circle, color: mColors[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: AlignmentDirectional.bottomCenter, child: Text(catNames[index].name)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 140.0,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: icons.length,
            itemBuilder: (BuildContext context, int index) {
              return _Listitem(index);
            },
          ),
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  int index;

  ProductItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image(
              image: AssetImage(products[index].imageUrl),
              height: 100.0,
              width: 150.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            products[index].name,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                ' ${(products[index].price.toStringAsFixed(2))} - ${(products[index].price + 100)
                    .toStringAsFixed(2)} ريال ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0),
            ],
          ),
        ],
      ),
    );
  }
}

//Widget noonBottomNav() {
//  return CupertinoTabBar(
//    iconSize: 22,
//    //          key: key,
//    inactiveColor: Colors.grey,
//    //      border: Border.all(color: Colors.grey, width: 1),
//    currentIndex: _currentTab,
//    onTap: (int index) {
//      if (index == 2) {
//        //            openDialog();
//      }
//      setState(() {
//        _currentTab = index;
//      });
//    },
//    activeColor: Colors.amber[400].withOpacity(0.5),
//
//    items: [
//      BottomNavigationBarItem(
//        title: Text(
//          'Home',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          FontAwesomeIcons.houseUser,
//          size: 28,
//        ),
//        icon: Icon(
//          FontAwesomeIcons.houseUser,
//          //              color: Colors.green,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'Categories',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          Icons.category,
//          size: 28,
//        ),
//        icon: Icon(
//          Icons.category,
//          //              color: Colors.amber,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'Deals',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: ImageIcon(
//          AssetImage('assets/images/amazon_app/sale.png'),
//          size: 28,
//        ),
//
//        //          icon: Icon(IconData(0xe800, fontFamily: "dealfont", fontPackage: "dealfont")),
//        icon: ImageIcon(
//          AssetImage('assets/images/amazon_app/sale.png'),
//          color: Colors.blue,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'My Account',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          Icons.person,
//          size: 28,
//        ),
//        icon: Icon(
//          Icons.person_outline, //              color: Colors.blue,
//        ),
//      ),
//      BottomNavigationBarItem(
//        title: Text(
//          'Cart',
//          style: TextStyle(color: Colors.black45),
//        ),
//        activeIcon: Icon(
//          Icons.shopping_cart,
//          size: 28,
//        ),
//        icon: Icon(
//          Icons.shopping_cart,
//          //              color: Colors.deepOrangeAccent,
//        ),
//      ),
//    ],
//  );
//}
