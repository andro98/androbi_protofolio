import 'package:androbi/core/config/Assets.dart';
import 'package:androbi/core/config/Styles.dart';
import 'package:androbi/core/config/palette.dart';
import 'package:androbi/main/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size.width);
    if (size.width <= 650)
      return smallAppBar(context);
    else
      return bigAppBar(context);
  }

  Widget smallAppBar(BuildContext context) {
    return Container(
      color: Palette.firstColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(Assets.profileImage),
            radius: 20,
          ),
          Text(
            "Andrew Maher",
            style: Styles.yellow15,
            textAlign: TextAlign.center,
          ),
          Text(
            "Game Developer",
            style: Styles.yellow15,
            textAlign: TextAlign.center,
          ),
          smallButtonBar(Icons.home, Pages.Quote, context),
          smallButtonBar(Icons.settings, Pages.Quote, context),
          smallButtonBar(Icons.memory, Pages.Quote, context),
          smallButtonBar(Icons.computer, Pages.Quote, context),
          smallButtonBar(Icons.contacts, Pages.Contact, context),
        ],
      ),
    );
  }

  Widget bigAppBar(BuildContext context) {
    return Container(
      color: Palette.firstColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(Assets.profileImage),
            radius: 80,
          ),
          Text(
            "Andrew Maher",
            style: Styles.yellow50,
            textAlign: TextAlign.center,
          ),
          Text(
            "Game Developer",
            style: Styles.yellow30,
            textAlign: TextAlign.center,
          ),
          buttonBar('Home', Styles.button30, Pages.Quote, context),
          buttonBar('Skills', Styles.button30, Pages.Quote, context),
          buttonBar('Experience', Styles.button30, Pages.Quote, context),
          buttonBar('Projects', Styles.button30, Pages.Quote, context),
          buttonBar('Contact Us', Styles.button30, Pages.Contact, context),
        ],
      ),
    );
  }

  Widget smallButtonBar(IconData icon, Pages pages, BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Palette.fifthColor,
      ),
      onPressed: () {
        Provider.of<MainProvider>(context, listen: false).changeState(pages);
      },
    );
  }

  Widget buttonBar(
      String text, TextStyle style, Pages pages, BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: style,
      ),
      onPressed: () {
        Provider.of<MainProvider>(context, listen: false).changeState(pages);
      },
    );
  }
}
