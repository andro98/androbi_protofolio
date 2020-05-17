import 'package:equatable/equatable.dart';

abstract class ExperienceEvent extends Equatable {
  ExperienceEvent([List props = const <dynamic>[]]) : super(props);
}

class GetExperiences extends ExperienceEvent {}