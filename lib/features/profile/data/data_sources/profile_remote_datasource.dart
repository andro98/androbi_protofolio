import 'package:androbi/core/error/exception.dart';
import 'package:androbi/features/profile/data/models/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Firestore firestore;

  ProfileRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<ProfileModel> getProfile() async {
    final response = await firestore
        .collection('profile')
        .document('1')
        .get()
        .catchError(() {
      throw ServerException();
    });
    return ProfileModel.fromJson(response.data);
  }
}
