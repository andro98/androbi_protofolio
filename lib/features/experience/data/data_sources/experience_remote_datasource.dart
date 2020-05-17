import 'package:androbi/core/error/exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class ExperienceRemoteDatasource {
  Future<List<DocumentSnapshot>> getExperience();
}

class ExperienceRemoteDatasourceImpl extends ExperienceRemoteDatasource {
  final Firestore firestore;

  ExperienceRemoteDatasourceImpl({@required this.firestore});

  @override
  Future<List<DocumentSnapshot>> getExperience() async {
    final response =
        await firestore.collection('experiences').getDocuments().catchError(() {
      throw ServerException();
    });
    return response.documents;
  }
}
