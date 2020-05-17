import 'package:androbi/core/error/exception.dart';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/experience/data/data_sources/experience_remote_datasource.dart';
import 'package:androbi/features/experience/data/models/experience_model.dart';
import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:androbi/features/experience/domain/repositories/experience_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class ExperienceRepositoryImpl extends ExperienceRepository {
  final ExperienceRemoteDatasource experienceRemoteDatasource;

  ExperienceRepositoryImpl({@required this.experienceRemoteDatasource});

  @override
  Future<Either<Failure, List<Experience>>> getExperiences() async {
    try {
      final experienceDocument = await experienceRemoteDatasource.getExperience();
      List<ExperienceModel> experiences = [];
      experienceDocument.forEach((element) {
        experiences.add(ExperienceModel.fromJson(element.data));
      });
      return Right(experiences);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
