import 'dart:async';

import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/profile/domain/entities/profile.dart';
import 'package:androbi/features/profile/domain/usecases/get_profile.dart'
    as usecase;
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import './bloc.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final usecase.GetProfile getProfile;

  ProfileBloc({@required usecase.GetProfile getProfile})
      : assert(getProfile != null),
        getProfile = getProfile;

  @override
  ProfileState get initialState => Loading();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GetProfile) {
      yield Loading();
      print('Calling GetQuote In QuoteBloc');
      final failureOrQuote = await getProfile(NoParams());
      print('Called GetQuote In QuoteBloc');
      yield* _eitherLoadedOrErrorState(failureOrQuote);
      print('Yielded');
    }
  }

  Stream<ProfileState> _eitherLoadedOrErrorState(
    Either<Failure, Profile> either,
  ) async* {
    yield either.fold(
      (failure) => Error(message: SERVER_FAILURE_MESSAGE),
      (profile) => Loaded(profile: profile),
    );
  }
}
