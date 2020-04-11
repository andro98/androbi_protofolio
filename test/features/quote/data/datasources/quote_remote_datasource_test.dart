import 'dart:convert';

import 'package:androbi/features/quote/data/datasources/quote_remote_datasource.dart';
import 'package:androbi/features/quote/data/models/quote_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixitures/fixture_reader.dart';

class MockFirestore extends Mock implements Firestore {}

void main() {
  MockFirestore mockFirestore;
  QuoteRemoteDataSourceImpl quoteRemoteDataSource;

  setUp(() {
    mockFirestore = MockFirestore();
    quoteRemoteDataSource = QuoteRemoteDataSourceImpl(firestore: mockFirestore);
  });

  group('getQuote', () {
    final tQuoteModel = QuoteModel.fromJson(json.decode(fixture('quote.json')));

    test(
        'should perfom a GET request on a URL with number being he endpoint and with application/json header',
        () async {
      when(mockFirestore
              .collection('quotes')
              .getDocuments()
              .then((value) => QuoteModel.fromJson(value.documents[0].data)))
          .thenAnswer((_) async => tQuoteModel);
      quoteRemoteDataSource.getQuote();
      verify(mockFirestore.collection('quotes').getDocuments());
    });
  });
}
