import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ExperienceState extends Equatable {
  ExperienceState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends ExperienceState {}

class Loaded extends ExperienceState {
  final List<Experience> experiences;

  Loaded({@required this.experiences}) : super([experiences]);
}

class Error extends ExperienceState {
  final String message;

  Error({@required this.message}) : super([message]);
}
