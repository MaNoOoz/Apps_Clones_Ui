import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MarsolApp());
  }
}

class MarsolApp extends StatefulWidget {
  static const String id = "MarsolAppApp";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarsolAppState();
  }
}

class _MarsolAppState extends State<MarsolApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final width = MediaQuery.of(context).size.width;

    // final width = 200.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Row(
                children: [
                  IconButton(
                    color: Colors.brown,
                    icon: Icon(Icons.add_location),
                  ),
                  Text(
                    "Dahrat Laban",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Row(
                children: [
                  IconButton(
                    color: Colors.brown,
                    icon: Icon(Icons.search),
                  ),
                  Text(
                    "Dahrat Laban",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120.0,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return CardRow(index, context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CardRow(index, context) {}
}
