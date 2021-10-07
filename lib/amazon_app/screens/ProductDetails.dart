



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_clones/amazon_app/widgets/widgets.dart';

import '../models.dart';
import 'CartScreen.dart';

class ProductDetails extends StatefulWidget {
  static const id = "ProductDetails";

  final Product? product;

  ProductDetails({this.product});

  //  final DocumentSnapshot documentSnapshot;
//  final bool isMe;
//  final String userId;

//  HebaDetails({this.product, this.documentSnapshot, this.isMe, this.userId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>
    with TickerProviderStateMixin {
  late AnimationController controller;
  Animation<double>? animation;

  List<Product?> _cartList = <Product?>[];
  var prodList;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    prodList = Provider.of<Data>(context, listen: false).products;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: mDetailsPage(context, widget.product),
    );
  }

  mDetailsPage(BuildContext context, Product? product) {
    Size screenSize = MediaQuery.of(context).size;

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
                      widget.product!.name!,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))),
            Spacer(),
//             Expanded(
//               flex: 3,
//               child: Container(
//                 color: Colors.white,
//                 child: SmoothStarRating(
//                     allowHalfRating: false,
//                     onRated: (v) {},
//                     starCount: 5,
//                     rating: rating,
//                     size: 20.0,
//                     isReadOnly: true,
// //                          fullRatedIconData: Icons.blur_off,
// //                          halfRatedIconData: Icons.blur_on,
//                     color: Colors.amber,
//                     borderColor: Colors.amberAccent,
//                     spacing: 0.0),
//               ),
//             ),
            Expanded(
                flex: 1,
                child: Container(color: Colors.white, child: Text("4.2"))),
          ],
        ),
      ),
    );
  }

  Body() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(child: Image.asset(widget.product!.imageUrl!)),
    );
  }

  Widget addToCart(BuildContext context, title) {
    var screenSize = MediaQuery.of(context).size;
    var item = widget.product;

    return FlatButton(
        onPressed: () async {
          setState(() {
            _cartList.add(item);
            // var addedHebaObject = Provider.of<Data>(context, listen: false).AddNewProduct(item);
          });
          // log("prodList  : ${prodList.length}");
          // log("_cartList Size : ${_cartList.length}");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CartScreen(products: prodList, product: item),
            ),
          );

          // Navigator.pushNamed(context, CartScreen());
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
        addToCart(context, "BuyNow"),
        addToCart(context, "Add To Cart"),
      ],
    );
  }
}
