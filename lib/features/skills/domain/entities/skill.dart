import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Skill extends Equatable {
  final int id;
  final String name;
  final int value;

  Skill({
    @required this.id,
    @required this.name,
    @required this.value,
  }) : super([id, name, value]);
}
