import 'dart:convert';

import 'package:androbi/features/quote/data/models/quote_model.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixitures/fixture_reader.dart';

void main() {
  final tQuoteModel = QuoteModel(quote_writer: 'Andrew', quote_desc: 'Test');

  test('should be subclass of Quote Entity', () async {
    expect(tQuoteModel, isA<Quote>());
  });

  test('fromJson', () async {
    final Map<String, dynamic> jsonMap = json.decode(fixture('quote.json'));
    final result = QuoteModel.fromJson(jsonMap);
    expect(result, tQuoteModel);
  });
}
