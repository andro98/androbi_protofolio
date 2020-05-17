import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Tutorial extends Equatable {
  int id;
  String content;
  String name;
  String img;

  Tutorial(
      {@required this.id,
      @required this.content,
      @required this.name,
      @required this.img,
      String context})
      : super([id, content, name, img]);
}
