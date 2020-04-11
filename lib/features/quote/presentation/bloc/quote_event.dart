import 'package:equatable/equatable.dart';

abstract class QuoteEvent extends Equatable {
  QuoteEvent([List props = const <dynamic>[]]) : super(props);
}

class GetQuote extends QuoteEvent {}
