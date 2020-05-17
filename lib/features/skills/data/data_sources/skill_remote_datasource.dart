import 'package:androbi/core/error/exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

abstract class SkillRemoteDatasource {
  Future<List<DocumentSnapshot>> getSkills();
}

class SkillRemoteDatasourceImpl extends SkillRemoteDatasource
{  final Firestore firestore;

  SkillRemoteDatasourceImpl({@required this.firestore});


@override
  Future<List<DocumentSnapshot>> getSkills() async{
    final response = await firestore.collection('skills').getDocuments().catchError((){
      throw ServerException();
    });
    return response.documents;
  }
}
