import 'dart:math';

import 'package:androbi/core/error/exception.dart';
import 'package:androbi/features/quote/data/models/quote_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class QuoteRemoteDataSource {
  Future<QuoteModel> getQuote();
}

class QuoteRemoteDataSourceImpl implements QuoteRemoteDataSource {
  final Firestore firestore;

  QuoteRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<QuoteModel> getQuote() async {
    print('In Datasource');
    final response =
        await firestore.collection('quotes').getDocuments().catchError(() {
      throw ServerException();
    });
    print('After calling firestore');
    final Random random = Random();
    final int newIndex = random.nextInt(response.documents.length);
    return QuoteModel.fromJson(response.documents[newIndex].data);
  }
}
