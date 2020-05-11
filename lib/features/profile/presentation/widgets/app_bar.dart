import 'package:androbi/core/config/palette.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextStyle pagesText = TextStyle(
    color: Colors.white,
    fontFamily: 'antiqua',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
              ),
              child: Text(
                'Andrew Maher',
                style: TextStyle(
                  color: Palette.yellowText,
                  fontFamily: 'antiqua',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Home',
              style: pagesText,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Work',
              style: pagesText,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 50),
            child: Text(
              'About',
              style: TextStyle(
                color: Palette.yellowText,
                fontFamily: 'antiqua',
                fontSize: 15,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(250.0);
  }
}
