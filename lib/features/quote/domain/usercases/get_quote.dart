import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:androbi/features/quote/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class GetQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;

  GetQuote(this.quoteRepository);

  @override
  Future<Either<Failure, Quote>> call(NoParams params) async {
    return await quoteRepository.getQuote();
  }
}
