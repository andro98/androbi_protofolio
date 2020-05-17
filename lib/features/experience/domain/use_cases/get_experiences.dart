import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:androbi/features/experience/domain/repositories/experience_repository.dart';
import 'package:dartz/dartz.dart';

class GetExperiences extends UseCase<List<Experience>, NoParams>{
  ExperienceRepository experienceRepository;

  GetExperiences(this.experienceRepository);

  @override
  Future<Either<Failure, List<Experience>>> call(NoParams params) async{
    return await experienceRepository.getExperiences();
  }
}