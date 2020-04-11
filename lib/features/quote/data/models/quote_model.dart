import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:meta/meta.dart';

class QuoteModel extends Quote {
  QuoteModel({
    @required String quote_desc,
    @required String quote_writer,
  }) : super(quote_writer: quote_writer, quote_desc: quote_desc);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quote_desc: json['quote'],
      quote_writer: json['quoteWrite'],
    );
  }
}
