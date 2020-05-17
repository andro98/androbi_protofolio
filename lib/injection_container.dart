import 'package:androbi/features/experience/data/data_sources/experience_remote_datasource.dart';
import 'package:androbi/features/experience/data/repositories/experience_repository_impl.dart';
import 'package:androbi/features/experience/domain/repositories/experience_repository.dart';
import 'package:androbi/features/experience/presentation/bloc/bloc.dart';
import 'package:androbi/features/quote/data/datasources/quote_remote_datasource.dart';
import 'package:androbi/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:androbi/features/quote/domain/repositories/quote_repository.dart';
import 'package:androbi/features/quote/domain/usercases/get_quote.dart' as dom;
import 'package:androbi/features/quote/presentation/bloc/bloc.dart';
import 'package:androbi/features/skills/data/data_sources/skill_remote_datasource.dart';
import 'package:androbi/features/skills/data/repositories/skill_repository_impl.dart';
import 'package:androbi/features/skills/domain/repositories/skill_repository.dart';
import 'package:androbi/features/skills/presentation/bloc/bloc.dart';
import 'package:androbi/features/tutorials/data/data_sources/tutorial_remote_datasource.dart';
import 'package:androbi/features/tutorials/data/repositories/tutorial_repository_impl.dart';
import 'package:androbi/features/tutorials/domain/repositories/tutorial_repository.dart';
import 'package:androbi/features/tutorials/domain/use_cases/get_tutorials.dart'
    as tutorial_usecase;
import 'package:androbi/features/skills/domain/use_cases/get_skills.dart'
    as skill_usecase;

import 'package:androbi/features/experience/domain/use_cases/get_experiences.dart'
    as experience_usecase;
import 'package:androbi/features/tutorials/presentation/bloc/tutorial_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => QuoteBloc(
      getQuote: sl(),
    ),
  );
  sl.registerFactory(
    () => TutorialBloc(
      getTutorials: sl(),
    ),
  );
  sl.registerFactory(
    () => SkillsBloc(
      getSkill: sl(),
    ),
  );
  sl.registerFactory(
    () => ExperienceBloc(
      getExperiences: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => dom.GetQuote(sl()));
  sl.registerLazySingleton(() => tutorial_usecase.GetTutorials(sl()));
  sl.registerLazySingleton(() => skill_usecase.GetSkills(sl()));
  sl.registerLazySingleton(() => experience_usecase.GetExperiences(sl()));

  //! External
  final firestore = await Firestore.instance;
  sl.registerLazySingleton(() => firestore);

  // Repository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
      quoteRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<TutorialRepository>(
    () => TutorialRepositoryImpl(
      tutorialRemoteDataSource: sl(),
    ),
  );
  sl.registerLazySingleton<SkillRepository>(
    () => SkillRepositoryImpl(
      skillRemoteDatasource: sl(),
    ),
  );
  sl.registerLazySingleton<ExperienceRepository>(
    () => ExperienceRepositoryImpl(
      experienceRemoteDatasource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<QuoteRemoteDataSource>(
    () => QuoteRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<TutorialRemoteDataSource>(
    () => TutorialRemoteDataSourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<SkillRemoteDatasource>(
    () => SkillRemoteDatasourceImpl(firestore: sl()),
  );
  sl.registerLazySingleton<ExperienceRemoteDatasource>(
    () => ExperienceRemoteDatasourceImpl(firestore: sl()),
  );
}
