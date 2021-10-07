import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ui_clones/amazon_app/screens/ProductDetails.dart';

import '../models.dart';
import 'CustomTabBar.dart';

class AmazonAppBar extends StatelessWidget   {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      width: MediaQuery.of(context).size.width - 10,
      // height: 140,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: GradientColors.mojito,
        ),
      ),
      // color: Colors.blueGrey[900],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Container(height: 50, child: Search()),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0, bottom: 5),
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text("التوصيل إلى عنيزة")),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.white,
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: "البحث في Amazon.sa ",
              hintStyle: GoogleFonts.cairo(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.withOpacity(0.9),
                  textBaseline: TextBaseline.ideographic),
              border: InputBorder.none,
              prefixIcon: Icon(
                LineIcons.search,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final String? title;
  final List<Product>? products;

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
            builder: (context) => ProductDetails(
              product: products![index],
            ),
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
                image: AssetImage(products![index].imageUrl!),
                height: 100.0,
                width: 150.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              products![index].name!,
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
                  ' ${(products![index].price!.toStringAsFixed(2))} - ${(products![index].price! + 100).toStringAsFixed(2)} ريال ',
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
            title!,
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
            itemCount: products!.length,
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
  final List<IconData>? icons;
  final List<Cat>? catNames;
  final List<Color>? colors;

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
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: mColors[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Text(catNames![index].name!)),
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
            itemCount: icons!.length,
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
  List<Product> products;

  ProductItem(this.products);

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
              image: AssetImage(products[0].imageUrl!),
              height: 100.0,
              width: 150.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            products[0].name!,
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
                ' ${(products[0].price!.toStringAsFixed(2))} - ${(products[0].price! + 100).toStringAsFixed(2)} ريال ',
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

class bottomNav extends StatelessWidget {
  final bottomSelectedIndex;
  final PageController? pageController;
  final Function? bottomTapped;

  bottomNav({this.bottomSelectedIndex, this.pageController, this.bottomTapped});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.only(bottom: 12.0),
      color: Colors.white,
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: CustomTabBar(
            icons: navIcons,
            selectedIndex: bottomSelectedIndex,
            onTap: (int index) {
              return bottomTapped!(index);
            }),
      ),
    );
  }
}
