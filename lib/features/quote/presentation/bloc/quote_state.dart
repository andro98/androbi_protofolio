import 'package:androbi/features/quote/domain/entities/quote.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class QuoteState extends Equatable {
  QuoteState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends QuoteState {}

class Loaded extends QuoteState {
  final Quote quote;

  Loaded({@required this.quote}) : super([quote]);
}

class Error extends QuoteState {
  final String message;

  Error({@required this.message}) : super([message]);
}
