import 'package:androbi/features/profile/domain/entities/profile.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProfileState extends Equatable {
  ProfileState([List props = const <dynamic>[]]) : super(props);
}

class Loading extends ProfileState {}

class Loaded extends ProfileState {
  final Profile profile;

  Loaded({@required this.profile}) : super([profile]);
}

class Error extends ProfileState {
  final String message;

  Error({@required this.message}) : super([message]);
}
