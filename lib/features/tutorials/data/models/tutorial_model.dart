import 'package:meta/meta.dart';
import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';

class TutorialModel extends Tutorial {
  TutorialModel({
    @required int id,
    @required String name,
    @required String img,
    @required String content,
  }) : super(id: id, name: name, img: img, content: content);

  factory TutorialModel.fromJson(Map<String, dynamic> json) {
    return TutorialModel(
      content: json['content'],
      id: json['id'],
      name: json['name'],
      img: json['img'],
    );
  }
}
