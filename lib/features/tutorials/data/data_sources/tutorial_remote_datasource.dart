import 'package:androbi/core/error/exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class TutorialRemoteDataSource {
  Future<List<DocumentSnapshot>> getTutorials();
}

class TutorialRemoteDataSourceImpl implements TutorialRemoteDataSource {
  final Firestore firestore;

  TutorialRemoteDataSourceImpl({@required this.firestore});

  @override
  Future<List<DocumentSnapshot>> getTutorials() async {
    final response =
        await firestore.collection('tutorial').getDocuments().catchError(() {
      throw ServerException();
    });
    return response.documents;
  }
}
