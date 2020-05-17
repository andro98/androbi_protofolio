import 'dart:async';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

import 'package:androbi/features/experience/domain/use_cases/get_experiences.dart'
as usecase;
const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  final usecase.GetExperiences getExperiences;

  ExperienceBloc({@required usecase.GetExperiences getExperiences})
      : assert(getExperiences != null),
        getExperiences = getExperiences;


  @override
  ExperienceState get initialState => Loading();

  @override
  Stream<ExperienceState> mapEventToState(
    ExperienceEvent event,
  ) async* {
    if (event is GetExperiences) {
      yield Loading();
      final failureOrQuote = await getExperiences(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrQuote);
    }
  }

  Stream<ExperienceState> _eitherLoadedOrErrorState(
      Either<Failure, List<Experience>> either,
      ) async* {
    yield either.fold(
          (failure) => Error(message: SERVER_FAILURE_MESSAGE),
          (experiences) {
        return Loaded(experiences: SortSkills(experiences));
      },
    );
  }

  List<Experience> SortSkills(List<Experience> experiences) {
    experiences.sort((a, b) => b.id.compareTo(a.id));
    return experiences;
  }
}
