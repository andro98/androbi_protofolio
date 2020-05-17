import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Experience extends Equatable{
  final int id;
  final String title;
  final String companyName;
  final String desc;
  final String from;
  final String to;
  final String location;
  final String logo;

  Experience({
    @required this.id,
    @required this.title,
    @required this.companyName,
    @required this.desc,
    @required this.from,
    @required this.to,
    @required this.location,
    @required this.logo,
  });
}