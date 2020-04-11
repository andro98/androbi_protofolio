import 'package:androbi/core/config/palette.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuoteDisplay extends StatelessWidget {
  final Quote quote;

  QuoteDisplay(this.quote);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 100),
      width: size.width * 0.8,
      height: 500,
      decoration: BoxDecoration(
        color: Palette.shadowBox,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              quote.quote_desc,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'antiqua',
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: size.width * 0.4),
            child: Text(
              quote.quote_writer,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'antiqua',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
