import 'dart:async';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:androbi/features/tutorials/domain/use_cases/get_tutorials.dart'
    as usecase;
import 'package:bloc/bloc.dart';
import 'bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final usecase.GetTutorials getTutorials;

  TutorialBloc({@required usecase.GetTutorials getTutorials})
      : assert(getTutorials != null),
        getTutorials = getTutorials;

  @override
  TutorialState get initialState => Loading();

  @override
  Stream<TutorialState> mapEventToState(
    TutorialEvent event,
  ) async* {
    if (event is GetTutorials) {
      yield Loading();
      final failureOrQuote = await getTutorials(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrQuote);
    }
  }

  Stream<TutorialState> _eitherLoadedOrErrorState(
    Either<Failure, List<Tutorial>> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: SERVER_FAILURE_MESSAGE),
      (tutorials) => Loaded(tutorials: tutorials),
    );
  }
}
