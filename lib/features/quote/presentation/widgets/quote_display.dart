import 'package:androbi/core/config/Styles.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuoteDisplay extends StatelessWidget {
  final Quote quote;

  QuoteDisplay(this.quote);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            quote.quote_writer,
            style: Styles.title50,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 100.0,
          ),
          Text(
            quote.quote_desc,
            style: Styles.desc30,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
