import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/profile/domain/entities/profile.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
}
