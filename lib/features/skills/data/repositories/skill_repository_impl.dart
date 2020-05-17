import 'package:androbi/core/error/exception.dart';
import 'package:androbi/core/error/failure.dart';
import 'package:androbi/features/skills/data/data_sources/skill_remote_datasource.dart';
import 'package:androbi/features/skills/data/models/skill_model.dart';
import 'package:androbi/features/skills/domain/entities/skill.dart';
import 'package:androbi/features/skills/domain/repositories/skill_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

class SkillRepositoryImpl extends SkillRepository {
  final SkillRemoteDatasource skillRemoteDatasource;

  SkillRepositoryImpl({@required this.skillRemoteDatasource});

  @override
  Future<Either<Failure, List<Skill>>> getSkills() async{
    try {
      final skilsDocument = await skillRemoteDatasource.getSkills();
      List<SkillModel> skills = [];
      skilsDocument.forEach((element) {
        skills.add(SkillModel.fromJson(element.data));
      });
      return Right(skills);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
