import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woocommerce/models/products.dart';

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

class ProductPage extends StatefulWidget {
  final WooProduct product;

  ProductPage({Key key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {
  final WooProduct product;

  _ProductPageState(this.product);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    Widget viewProductButton = InkWell(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ViewProductPage(product: product,))),
      child: Container(
        height: 80,
        width: width / 1.5,
        decoration: BoxDecoration(
            gradient: mainButton,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
          child: Text("View Product",
              style: const TextStyle(
                  color: const Color(0xfffefefe),
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: <Widget>[
          // IconButton(
          //   icon: new SvgPicture.asset('assets/icons/search_icon.svg', fit: BoxFit.scaleDown,), onPressed: ()=> Navigator.of(context).push(
          //     MaterialPageRoute(builder: (_) => SearchPage())),)
        ],
        title: Text(
          '${product.categories[0].name}',
          style: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                ProductDisplay(
                  product: product,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(253, 192, 84, 1),
                          borderRadius: BorderRadius.circular(4.0),
                          border:
                              Border.all(color: Color(0xFFFFFFFF), width: 0.5),
                        ),
                        child: Center(
                          child: new Text("Details",
                              style: const TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0)),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 40.0, bottom: 130),
                    child: new Text(product.sku,
                        style: const TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w800,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0)))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                  top: 8.0, bottom: bottomPadding != 20 ? 20 : bottomPadding),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(253, 255, 255, 0.5),
                    Color.fromRGBO(253, 255, 255, 1),
                  ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter)),
              width: width,
              height: 120,
              child: Center(child: viewProductButton),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductDisplay extends StatelessWidget {
  final WooProduct product;

  const ProductDisplay({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Align(
            // alignment: Alignment(1,0),
            alignment: AlignmentDirectional.bottomEnd,
            child: Padding(
              padding: const EdgeInsets.only(right: 1.0, left: 0.0),
              child: Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: AlignmentDirectional.topCenter,

                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8.0,
                        ),
                        child: Container(
                          child: Hero(
                            tag: product.images[0].src,
                            child: Image.network(
                              product.images[0].src,
                              fit: BoxFit.contain,
                              height: 180,
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          Positioned(
              right: 0,
              bottom: 1,
              child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 85,
                  padding: EdgeInsets.only(right: 24),
                  decoration: new BoxDecoration(
                      color: CupertinoColors.darkBackgroundGray,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            offset: Offset(0, 3),
                            blurRadius: 6.0),
                      ]),
                  child: Align(
                    alignment: Alignment(1, 0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '\$ ${product.price}',
                          style: const TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontSize: 36.0)),
                      TextSpan(
                          text: '.58',
                          style: const TextStyle(
                              color: const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Montserrat",
                              fontSize: 18.0))
                    ])),
                  ))),
          Positioned(
            left: 20.0,
            bottom: 0.0,
            child: RawMaterialButton(
              // onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => RatingPage())),
              constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
              child:
                  Icon(Icons.favorite, color: Color.fromRGBO(255, 137, 147, 1)),
              elevation: 0.0,
              shape: CircleBorder(),
              fillColor: Color.fromRGBO(255, 255, 255, 0.4),
            ),
          )
        ],
      ),
    );
  }
}
