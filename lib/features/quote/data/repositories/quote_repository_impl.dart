import 'package:androbi/core/error/exception.dart';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/quote/data/datasources/quote_remote_datasource.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:androbi/features/quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class QuoteRepositoryImpl extends QuoteRepository {
  final QuoteRemoteDataSource quoteRemoteDataSource;

  QuoteRepositoryImpl({@required this.quoteRemoteDataSource});

  @override
  Future<Either<Failure, Quote>> getQuote() async {
    try {
      print('Goinf To Impl');
      final quote = await quoteRemoteDataSource.getQuote();
      return Right(quote);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
