import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:dartz/dartz.dart';

abstract class SkillRepository {
  Future<Either<Failure, List<Skill>>> getSkills();
}
