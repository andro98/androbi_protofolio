import 'package:androbi/core/error/failure.dart';
import 'package:androbi/core/usecases/usecase.dart';
import 'package:androbi/features/profile/domain/entities/profile.dart';
import 'package:androbi/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetProfile implements UseCase<Profile, NoParams> {
  final ProfileRepository profileRepository;

  GetProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    profileRepository.getProfile();
  }
}
