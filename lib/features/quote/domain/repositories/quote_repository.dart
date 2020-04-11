import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getQuote();
}
