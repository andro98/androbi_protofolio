import 'package:androbi/core/error/exception.dart';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/profile/data/data_sources/profile_remote_datasource.dart';
import 'package:androbi/features/profile/domain/entities/profile.dart';
import 'package:androbi/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({@required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final profile = await profileRemoteDataSource.getProfile();
      return Right(profile);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
