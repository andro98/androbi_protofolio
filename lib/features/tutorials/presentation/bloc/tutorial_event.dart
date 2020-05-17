import 'package:equatable/equatable.dart';

abstract class TutorialEvent extends Equatable {
  TutorialEvent([List props = const <dynamic>[]]) : super(props);
}

class GetTutorials extends TutorialEvent {}
