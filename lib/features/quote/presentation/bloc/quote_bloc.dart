import 'dart:async';

import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:androbi/features/quote/domain/usercases/get_quote.dart'
    as usecase;
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final usecase.GetQuote getQuote;

  QuoteBloc({@required usecase.GetQuote getQuote})
      : assert(getQuote != null),
        getQuote = getQuote;

  @override
  QuoteState get initialState => Loading();

  @override
  Stream<QuoteState> mapEventToState(
    QuoteEvent event,
  ) async* {
    if (event is GetQuote) {
      yield Loading();
      final failureOrQuote = await getQuote(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrQuote);
    }
  }

  Stream<QuoteState> _eitherLoadedOrErrorState(
    Either<Failure, Quote> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: SERVER_FAILURE_MESSAGE),
      (quote) => Loaded(quote: quote),
    );
  }
}
