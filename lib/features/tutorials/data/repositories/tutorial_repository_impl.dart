import 'package:androbi/core/error/exception.dart';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/tutorials/data/data_sources/tutorial_remote_datasource.dart';
import 'package:androbi/features/tutorials/data/models/tutorial_model.dart';
import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:androbi/features/tutorials/domain/repositories/tutorial_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class TutorialRepositoryImpl extends TutorialRepository {
  final TutorialRemoteDataSource tutorialRemoteDataSource;

  TutorialRepositoryImpl({@required this.tutorialRemoteDataSource});

  @override
  Future<Either<Failure, List<Tutorial>>> getTutorials() async {
    try {
      final tutorialsDocument = await tutorialRemoteDataSource.getTutorials();
      List<TutorialModel> tutorials = [];
      tutorialsDocument.forEach((element) {
        tutorials.add(TutorialModel.fromJson(element.data));
      });
      return Right(tutorials);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
