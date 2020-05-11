import 'package:androbi/features/profile/domain/entities/profile.dart';
import 'package:meta/meta.dart';

class ProfileModel extends Profile {
  ProfileModel({
    @required String name,
    @required String title,
    @required String bio,
    @required String photo,
    @required String facebook_url,
    @required String github_url,
    @required String linkedin_url,
    @required String email_url,
    @required String twiter_url,
    @required String stackoverflow_url,
  }) : super(
            name: name,
            title: title,
            bio: bio,
            photo: photo,
            facebook_url: facebook_url,
            github_url: github_url,
            linkedin_url: linkedin_url,
            email_url: email_url,
            twiter_url: twiter_url,
            stackoverflow_url: stackoverflow_url);

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        name: json['name'],
        title: json['title'],
        bio: json['bio'],
        photo: json['photo'],
        facebook_url: json['facebook_url'],
        github_url: json['github_url'],
        linkedin_url: json['linkedin_url'],
        email_url: json['email_url'],
        twiter_url: json['twiter_url'],
        stackoverflow_url: json['stackoverflow_url']);
  }
}
