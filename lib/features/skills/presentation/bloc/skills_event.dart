import 'package:equatable/equatable.dart';

abstract class SkillsEvent extends Equatable {
  SkillsEvent([List props = const <dynamic>[]]) : super(props);
}

class GetSkills extends SkillsEvent {}