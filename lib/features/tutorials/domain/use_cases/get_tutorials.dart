import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:androbi/features/tutorials/domain/repositories/tutorial_repository.dart';
import 'package:dartz/dartz.dart';

class GetTutorials implements UseCase<List<Tutorial>, NoParams> {
  final TutorialRepository tutorialRepository;

  GetTutorials(this.tutorialRepository);

  @override
  Future<Either<Failure, List<Tutorial>>> call(NoParams params) async {
    return await tutorialRepository.getTutorials();
  }
}
