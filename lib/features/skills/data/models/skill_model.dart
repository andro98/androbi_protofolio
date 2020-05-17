import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:meta/meta.dart';

class SkillModel extends Skill {
  SkillModel({
    @required int id,
    @required String name,
    @required int value,
  }) : super(id: id, name: name, value: value);

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );
}
