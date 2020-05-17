import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SkillsState extends Equatable {
  SkillsState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends SkillsState {}

class Loaded extends SkillsState {
  final List<Skill> skills;

  Loaded({@required this.skills}) : super([skills]);
}

class Error extends SkillsState {
  final String message;

  Error({@required this.message}) : super([message]);
}
