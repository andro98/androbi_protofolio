import 'package:androbi/core/config/Assets.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

class Info {
  final String icon;
  final String url;

  Info(this.icon, this.url);
}

class ContactPage extends StatelessWidget {
  Size size;
  List<Info> infos = [
    Info(Assets.github, 'https://github.com/andro98'),
    Info(Assets.stack, 'https://stackoverflow.com/users/4996527/andrew-maher'),
    Info(
        Assets.linkedin, 'https://www.linkedin.com/in/andrew-maher-a1a482151/'),
    Info(Assets.itch, 'https://androoo998.itch.io/'),
    Info(Assets.gmail, 'mailto:andrewaacodo12@gmail.com'),
    Info(Assets.twitter, 'https://twitter.com/Andro28981316'),
    Info(Assets.facebook, 'https://www.facebook.com/AndrOoO.a')
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(infos.length, (index) {
        return buildIcon(infos[index]);
      }),
    );
  }

  Widget buildIcon(Info info) {
    return RawMaterialButton(
      onPressed: () {
        js.context.callMethod("open", [info.url]);
      },
      elevation: 2.0,
      child: Image.asset(
        info.icon,
        width: 0.1 * size.width,
        height: 0.1 * size.height,
      ),
      shape: CircleBorder(),
    );
  }
}
