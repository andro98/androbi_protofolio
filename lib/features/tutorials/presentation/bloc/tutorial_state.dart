import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class TutorialState extends Equatable {
  TutorialState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends TutorialState {}

class Loaded extends TutorialState {
  final List<Tutorial> tutorials;

  Loaded({@required this.tutorials}) : super([tutorials]);
}

class Error extends TutorialState {
  final String message;

  Error({@required this.message}) : super([message]);
}
