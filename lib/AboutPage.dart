import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Constants.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'manoo.sar@gmail.com',
        queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            gradient: LinearGradient(
              colors: GradientColors.orange,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: LinearGradient(
                        colors: GradientColors.mango,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Center(
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/images/myIcon.png"),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Yaman Alkhateeb",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          var url =
                              "https://www.linkedin.com/in/yaman-alkhateb/";
                          launch(url.toString());
                        },
                        title: Text(
                          "LinkedIn",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                          size: 18,
                        ),
                        subtitle: Text('My Profile'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      ListTile(
                        onTap: () {
                          var url = "https://twitter.com/MaNoOoz77";
                          launch(url.toString());
                        },
                        title: Text(
                          "Twitter",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(FontAwesomeIcons.twitterSquare,
                            color: Colors.white, size: 18),
                        subtitle: Text('Follow me '),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      ListTile(
                        onTap: () {
                          var url =
                              "https://play.google.com/store/apps/dev?id=8389389659889758696";
                          launch(url.toString());
                        },
                        title: Text(
                          "Google Play",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(FontAwesomeIcons.googlePlay,
                            color: Colors.white, size: 18),
                        subtitle: Text('My Apps On Google Play'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                      ListTile(
                        onTap: () {
                          launch(_emailLaunchUri.toString());
                        },
                        title: Text(
                          "Email Me ",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Icon(FontAwesomeIcons.googlePlay,
                            color: Colors.white, size: 18),
                        subtitle: Text('at manoo.sar@gmail.com'),
                        trailing: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(
        horizontal: 14,
      ).copyWith(
        bottom: 14,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.lightBlue),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: 4,
          ),
          SizedBox(width: kSpacingUnit * 1.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              Icons.keyboard_arrow_right_outlined,
              size: kSpacingUnit * 2.5,
            ),
        ],
      ),
    );
  }
}
