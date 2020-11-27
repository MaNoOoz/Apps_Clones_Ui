import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class CartScreen extends StatefulWidget {
  final List<Product> _products;
  final Product _product;

  CartScreen(this._products, this._product);

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
    _productsInCart = widget._products;
  }

  Widget _submitButton(BuildContext context, title) {
    var screenSize = MediaQuery.of(context).size;

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

  Widget ActionsButtons(
      BuildContext context, title, int index, Function function) {
    var screenSize = MediaQuery.of(context).size;
    var _cartList = <Product>[];
    var item = widget._products;

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
    var screenSize = MediaQuery.of(context).size;
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
                  child: ActionsButtons(
                      context, "حفظ لوقت لاحق", index, () => delete()),
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
                          count= 0;
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
    final textTheme = Theme.of(context).textTheme;
    var product = widget._product;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'سلة التسوق',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          total(context,
              "  المجموع الجزئي ( ${_productsInCart.length} سلعة )  ", product),
          _submitButton(context, "إتمام عملية الشراء"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _productsInCart.length,
            itemBuilder: (BuildContext context, int index) {
              log("${_productsInCart.length}");

              return _buildCartProduct(index, context, _productsInCart[index]);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              'قام المستخدمون الذين اشتروا نفس السلع في عربة التسوق بشراء',
              style: TextStyle(
                fontSize: 22.0,
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
