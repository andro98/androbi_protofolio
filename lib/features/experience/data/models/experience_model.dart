import 'package:androbi/features/experience/domain/entities/experience.dart';
import 'package:meta/meta.dart';

class ExperienceModel extends Experience {
  ExperienceModel({
    @required int id,
    @required String title,
    @required String companyName,
    @required String desc,
    @required String from,
    @required String to,
    @required String location,
    @required String logo,
  }) : super(
            id: id,
            title: title,
            companyName: companyName,
            desc: desc,
            from: from,
            to: to,
            location: location,
            logo: logo);

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        desc: json["desc"] == null ? null : json["desc"],
        from: json["from"] == null ? null : json["from"],
        to: json["to"] == null ? null : json["to"],
        location: json["location"] == null ? null : json["location"],
        logo: json["logo"] == null ? null : json["logo"],
      );
}
