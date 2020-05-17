import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:dartz/dartz.dart';

abstract class ExperienceRepository{
  Future<Either<Failure, List<Experience>>> getExperiences();
}