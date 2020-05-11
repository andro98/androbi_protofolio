import 'package:androbi/core/config/Assets.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class ContactPage extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        top: 100.0,
        left: 50.0,
        right: 50.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                buildIcon(Assets.github, 'https://github.com/andro98'),
                buildIcon(Assets.stack, 'https://stackoverflow.com/users/4996527/andrew-maher'),
                buildIcon(Assets.linkedin, 'https://www.linkedin.com/in/andrew-maher-a1a482151/'),
              ],
            ),
            SizedBox(height: 80.0,),
            Row(
              children: <Widget>[
                buildIcon(Assets.itch, 'https://androoo998.itch.io/'),
                buildIcon(Assets.gmail, 'mailto:andrewaacodo12@gmail.com'),
                buildIcon(Assets.twitter, 'https://twitter.com/Andro28981316'),
              ],
            ),
            SizedBox(height: 80.0,),
            Row(
              children: <Widget>[
                buildIcon(Assets.facebook, 'https://www.facebook.com/AndrOoO.a'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIcon(String icon, String url) {
    return Expanded(
      flex: 1,
      child: RawMaterialButton(
        onPressed: () {
          js.context.callMethod("open", [url]);
        },
        elevation: 2.0,
        child: Image.asset(
          icon,
          width: 0.1 * size.width,
          height: 0.1 * size.height,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}
