import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:androbi/features/skills/domain/repositories/skill_repository.dart';
import 'package:dartz/dartz.dart';

class GetSkills extends UseCase<List<Skill>, NoParams>{
  SkillRepository skillRepository;

  GetSkills(this.skillRepository);

  @override
  Future<Either<Failure, List<Skill>>> call(NoParams params) async{
    return await skillRepository.getSkills();
  }
}