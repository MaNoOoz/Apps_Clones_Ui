import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ui_clones/amazon_app/models.dart';

class ResturantsPage extends StatefulWidget {
  static const String id = "ResturantsPage";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ResturantsPage();
  }
}

class _ResturantsPage extends State<ResturantsPage> {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    var resturants2 = Provider.of<Data>(context).resturants2;

    // final width = 200.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
          child: Container(
            color: Color(0xFFFFD700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFFFD700),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.brown[900],
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "التوصيل إلى لبن",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown[900]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  // width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),

                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black38,
                          ),
                        ),
                        Text("بحث عن مطعم"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 120,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                CardRow(resturants2[0]),
                CardRow(resturants2[1]),
                CardRow(resturants2[2]),
                CardRow(resturants2[3]),
                CardRow(resturants2[4]),
                CardRow(resturants2[5]),
                CardRow(resturants2[6]),
                CardRow(resturants2[7]),
                CardRow(resturants2[8]),
              ],
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF7CC33),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "الكل",
                            ),
                          ),
                        )),
                  ),
                  FilterRow(0),
                  FilterRow(1),
                  FilterRow(2),
                  FilterRow(3),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 150.0, child: ResteurantRow(0, width, resturants2[0])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 150.0, child: ResteurantRow(1, width, resturants2[1])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 150.0, child: ResteurantRow(2, width, resturants2[2])),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(height: 150.0, child: ResteurantRow(2, width, resturants2[3])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardRow extends StatelessWidget {
  Resturant resturant;

  CardRow(this.resturant);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 100,
      child: Stack(
        children: [
          Positioned(
            top: 19,
            right: 0,
            left: 10,
            child: Container(
              height: 80,
              width: 100,
              child: Card(
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(color: Colors.white, width: 0.3),
                ),

                // margin: EdgeInsets.all(1),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        resturant.title,
                        softWrap: false,
                        maxLines: 1,
                        // overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold, color: Colors.brown[900]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 12,
            right: 0,
            child: Container(
                height: 60,
                child: Image.asset(
                  resturant.imageUrl,
                  scale: 1,
                )),
          ),
        ],
      ),
    );
  }
}

class FilterRow extends StatelessWidget {
  int index;

  FilterRow(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: catIcons[index],
          ),
          // Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(mFilterTitle[index]),
          ),
        ],
      ),
    );
  }
}

class ResteurantRow extends StatelessWidget {
  int index;
  var width;
  Resturant resturant;

  ResteurantRow(this.index, this.width, this.resturant);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        width: width,
        height: 100,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /// image
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 50, child: Image.asset("${resturant.imageUrl}")),
                    ),

                    Container(
                      color: Colors.black12,
                      height: 11,
                    ),

                    /// Rating
                    Container(
                      height: 40,
                      child: Center(
                        child: Text.rich(
                          TextSpan(children: <InlineSpan>[
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.yellow,
                              ),
                            ),
                            TextSpan(text: "${resturant.rating}"),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: 1,
                  color: Colors.black12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListTile(
                          title: Text(resturant.title),
                          subtitle: Text(resturant.type ?? ""),
                          trailing: resturant.lable.isNotEmpty
                              ? Container(
                                  height: 20,
                                  width: 50,
                                  color: Colors.yellow.withOpacity(0.4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Center(
                                      child: Text(
                                        "${resturant.lable}",
                                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                          isThreeLine: true,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text.rich(
                                      TextSpan(text: " 5.4 كم | 20 - 30 دقيقة | التوصيل 5.0 ريال")),
                                ),
                              ),
                            )),
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Container(
                                child: Text.rich(
                                  TextSpan(children: [
                                    WidgetSpan(
                                        child: Icon(
                                      FontAwesomeIcons.fastForward,
                                      size: 12,
                                    )),
                                    TextSpan(text: "   أسرع شي !"),
                                  ]),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
