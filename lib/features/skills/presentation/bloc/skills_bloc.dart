import 'dart:async';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:androbi/features/skills/domain/use_cases/get_skills.dart'
    as usecase;
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'bloc.dart';
import 'package:meta/meta.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final usecase.GetSkills getSkill;

  SkillsBloc({@required usecase.GetSkills getSkill})
      : assert(getSkill != null),
        getSkill = getSkill;

  @override
  SkillsState get initialState => Loading();

  @override
  Stream<SkillsState> mapEventToState(
    SkillsEvent event,
  ) async* {
    if (event is GetSkills) {
      yield Loading();
      final failureOrQuote = await getSkill(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrQuote);
    }
  }

  Stream<SkillsState> _eitherLoadedOrErrorState(
    Either<Failure, List<Skill>> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: SERVER_FAILURE_MESSAGE),
      (skills) {
        return Loaded(skills: SortSkills(skills));
      },
    );
  }

  List<Skill> SortSkills(List<Skill> skills) {
    skills.sort((a, b) => b.value.compareTo(a.value));
    return skills;
  }
}
