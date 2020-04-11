import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:androbi/features/quote/domain/repositories/quote_repository.dart';
import 'package:androbi/features/quote/domain/usercases/get_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetQuoteRepository extends Mock implements QuoteRepository {}

void main() {
  MockGetQuoteRepository getQuoteRepository;
  GetQuote usecase;

  setUp(() {
    getQuoteRepository = MockGetQuoteRepository();
    usecase = GetQuote(getQuoteRepository);
  });

  final tQuote = Quote(quote_desc: 'Test', quote_writer: 'Andrew');

  test('should get quote from repository', () async {
    when(getQuoteRepository.getQuote()).thenAnswer((_) async => Right(tQuote));

    final result = await usecase(NoParams());

    expect(result, Right(tQuote));

    verify(getQuoteRepository.getQuote());

    verifyNoMoreInteractions(getQuoteRepository);
  });
}
