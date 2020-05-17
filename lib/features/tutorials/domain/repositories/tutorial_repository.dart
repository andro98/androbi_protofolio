import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:dartz/dartz.dart';

abstract class TutorialRepository {
  Future<Either<Failure, List<Tutorial>>> getTutorials();
}
