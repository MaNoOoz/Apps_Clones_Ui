import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ui_clones/linkedIn_app/models/Post.dart';

import '../../Constants.dart';
class PostCard extends StatelessWidget {
  Post model;
  final GestureTapCallback? press;

  PostCard({
    Key? key,
    required this.model,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenH = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 800,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).focusColor.withOpacity(0.2),
                  blurRadius: 1,
                  offset: Offset(2, 4)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              headerBar(screenWidth, screenH, model),
              // Container(
              //   height: 1,
              //   color: Colors.black12,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ReadMoreText(
                  "${model.content}",
                  //
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام"
                  // "الحب سماء لا تمطر غير الأحلام",
                  trimLines: 4,
                  locale: Locale("ar"),
                  textAlign: TextAlign.left,
                  style: fontStyle.copyWith(color: Colors.black87,fontSize: 16),
                  colorClickableText: Colors.black26,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: fontStyle.copyWith(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                  lessStyle: fontStyle.copyWith(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  " #programming #flutter #motivation #learning #progress #development #networking #business #jobhunters #jobseekers #connections #networking #linkedin #nevergiveup #staypositive #staystrong #positiveattitude",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              Flexible(
                  child: model.image == null
                      ? Image.asset(
                          "assets/images/resturants_ui_app/icon/burger.jpg")
                      : Image.asset(model.image.toString())),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/icons/like.png"),
                  ),
                  Container(width: 2,),
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/icons/celebrate_icon.png"),
                  ),
                  Container(width: 2,),

                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/icons/love_icon.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 25,
                      width: 25,
                      child:  AutoSizeText(
                        "120",
                        style: fontStyle.copyWith(
                            fontSize: 14, color: Colors.black45),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Container(
                        child: AutoSizeText(
                          "${model.id} comments",
                          style: fontStyle.copyWith(
                              fontSize: 16, color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                height: 1,
                color: Colors.black12,
              ),
              bottomBar(
                screenWidth,
                screenH,
                model,
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget rightSide() {
  //   var image = "$BaseUrl${model.adImages![0].formats!.thumbnail!.url}";
  //
  //   return Container(
  //     color: Colors.white,
  //     child: Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Hero(
  //             tag: Uuid(),
  //             child: Container(
  //               height: 100,
  //               width: 100,
  //               child: CachedNetworkImage(
  //                 imageUrl: "$image",
  //                 placeholder: (context, url) =>
  //                     Center(child: CircularProgressIndicator()),
  //                 errorWidget: (context, url, error) => Image.network(
  //                     "https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg"),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Expanded leftSide(ad) {
  //   return Expanded(
  //     child: Container(
  //       color: Colors.white,
  //       padding: EdgeInsets.all(8),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         textDirection: TextDirection.rtl,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Expanded(
  //             flex: 2,
  //             child: Column(
  //               textDirection: TextDirection.rtl,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 AutoSizeText(
  //                   "${model.title}",
  //                   maxFontSize: 20,
  //                   maxLines: 3,
  //                   textDirection: TextDirection.rtl,
  //                   overflow: TextOverflow.ellipsis,
  //                   // softWrap: false,
  //                   style: fontStyle.copyWith(
  //                       color: Colors.black54,
  //                       fontWeight: FontWeight.bold,
  //                       fontSize: 60),
  //                 ),
  //                 SizedBox(height: 5),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget headerBar(screenWidth, screenH, Post post) {
    var time2 = timeago.format(
      model.createdAt!,
      locale: 'en_short',
    );

    return Container(
      decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor,
          // color: Colors.white,

          // borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
      child: Stack(
        children: [
          // Spacer(),
          Container(
            child: ListTile(
              // onTap: () => Get.to(() => AdView(item)),

              isThreeLine: true,
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
                foregroundColor: Colors.green,
                backgroundImage: AssetImage(
                  "assets/images/me.jpg",

                  // fit: BoxFit.fill,
                ),
              ),
              title: Text('${post.user!.username}'),
              subtitle: Text('${post.user!.userJob}\n${time2}'),
            ),
          ),
          Positioned(
            top: 1,
            right: 2,
            child: IconButton(
                icon: Icon(CupertinoIcons.ellipsis),
                onPressed: () {
                  print("IconButton");
                }),
          ),
        ],
      ),
    );
  }

  Widget bottomBar(
    screenWidth,
    screenH,
    Post ad,
  ) {
    return Container(
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor,
        // color: Colors.red,

        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: 60,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(4),
        width: screenWidth,
        child: Row(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // TextButton.icon(
            //     onPressed: () {
            //       print("FlatButton.icon");
            //     },
            //     style: TextButton.styleFrom(
            //       maximumSize: const Size(double.maxFinite,
            //           double.maxFinite), // <--- this line helped me
            //     ),
            //     icon: Icon(
            //       CupertinoIcons.hand_thumbsup,
            //       color: Colors.black45,
            //       size: 18,
            //     ),
            //     label: Text(
            //       "Like",
            //       style:
            //           fontStyle.copyWith(color: Colors.black45, fontSize: 16),
            //     )),
            Container(
              // color: Colors.red,

              child: FlutterReactionButtonCheck(
                onReactionChanged: (reaction, index, isChecked) {
                  print('reaction selected index: $index');
                },
                reactions: <Reaction>[

                  Reaction(
                    previewIcon: buildWidgetPreview(
                      path: 'assets/icons/like.png',
                      text: Text('Like'),
                    ),
                    icon: buildWidget(
                        path: 'assets/icons/like.png', text: Text("like")),
                  ),
                  Reaction(
                    previewIcon: buildWidgetPreview(
                      path: 'assets/icons/celebrate_icon.png',
                      text: Text('Celebrate'),
                    ),
                    icon: buildWidget(
                        path: 'assets/icons/celebrate_icon.png', text: Text("Celebrate")),
                  ),
                  Reaction(
                    previewIcon: buildWidgetPreview(
                      path: 'assets/icons/heartinhand250.png',
                      text: Text('Support'),
                    ),
                    icon: buildWidget(
                        path: 'assets/icons/heartinhand250.png', text: Text("Support")),
                  ),
                  Reaction(
                    previewIcon: buildWidgetPreview(
                      path: 'assets/icons/love_icon.png',
                      text: Text('Love'),
                    ),
                    icon: buildWidget(
                        path: 'assets/icons/love_icon.png', text: Text("Love")),
                  ),
                  Reaction(
                    previewIcon: buildWidgetPreview(
                      path: 'assets/icons/insightful_icon.png',
                      text: Text('insightful'),
                    ),
                    icon: buildWidget(
                        path: 'assets/icons/insightful_icon.png', text: Text("Insightful")),
                  ),
                  Reaction(
                    previewIcon: buildWidgetPreview(
                      path: 'assets/icons/purplesmiley250.png',
                      text: Text('mhhh'),
                    ),
                    icon: buildWidget(
                        path: 'assets/icons/purplesmiley250.png', text: Text("mhhh")),
                  ),
                ],
                initialReaction: defaultInitialReaction,
                selectedReaction: selectedReaction,
              ),
            ),

            Container(
              // color: Colors.red,
              child: TextButton.icon(
                  onPressed: () {
                    print("Comment");
                  },
                  icon: Icon(
                    CupertinoIcons.chat_bubble,
                    color: Colors.black87,
                    size: 18,
                  ),
                  label: Text(
                    "Comment",
                    style:
                        fontStyle.copyWith(color: Colors.black87, fontSize: 16),
                  )),
            ),
            Container(
              // color: Colors.red,
              child: TextButton.icon(
                  onPressed: () {
                    print("Share");
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_turn_up_right,
                    color: Colors.black87,
                    size: 18,
                  ),
                  label: Text(
                    "Share",
                    style:
                        fontStyle.copyWith(color: Colors.black87, fontSize: 16),
                  )),
            ),
            Container(
              // color: Colors.red,
              child: TextButton.icon(
                  onPressed: () {
                    print("Send");
                  },
                  icon: Icon(
                    CupertinoIcons.paperplane,
                    color: Colors.black87,
                    size: 18,
                  ),
                  label: Text(
                    "Send",
                    style:
                        fontStyle.copyWith(color: Colors.black87, fontSize: 16),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  buildWidgetPreview({required String path, required Text text}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              path,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 5),
            Text(
              "${text.data}",
            ),
          ],
        ),
      ),
    );

  }
  buildWidget({required String path, required Text text}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              path,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 5),
            Text(
              "${text.data}",
            ),
          ],
        ),
      ),
    );
  }
  final defaultInitialReaction = Reaction(
    icon: TextButton.icon(
      onPressed: () {
        print("Like");
      },
      icon: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Icon(
          CupertinoIcons.hand_thumbsup,
          size: 18,
          color: Colors.black87,
        ),
      ),
      label: Text(
        "Like",
        style: fontStyle.copyWith(color: Colors.black87, fontSize: 16),
      ),
    ),
  );
  final selectedReaction = Reaction(
    icon: TextButton.icon(
      onPressed: () {
        print("Like");
      },
      icon: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Icon(
          CupertinoIcons.hand_thumbsup,
          size: 18,
        ),
      ),
      label: Text(
        "Like",
        style: fontStyle.copyWith(color: Colors.black45, fontSize: 16),
      ),
    ),
  );
}
