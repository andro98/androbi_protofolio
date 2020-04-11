import 'package:androbi/features/quote/data/datasources/quote_remote_datasource.dart';
import 'package:androbi/features/quote/data/repositories/quote_repository_impl.dart';
import 'package:androbi/features/quote/domain/repositories/quote_repository.dart';
import 'package:androbi/features/quote/domain/usercases/get_quote.dart' as dom;
import 'package:androbi/features/quote/presentation/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => QuoteBloc(
      getQuote: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => dom.GetQuote(sl()));

  //! External
  final firestore = await Firestore.instance;
  sl.registerLazySingleton(() => firestore);

  // Repository
  sl.registerLazySingleton<QuoteRepository>(
    () => QuoteRepositoryImpl(
      quoteRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<QuoteRemoteDataSource>(
    () => QuoteRemoteDataSourceImpl(firestore: sl()),
  );
}
