import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Quote extends Equatable {
  /*final String name;
  final String title;
  final String bio;
  final String photo;
  final String facebook_url;
  final String github_url;
  final String linkedin_url;
  final String email_url;
  final String twiter_url;
  final String stackoverflow_url;

  Quote({
    @required this.name,
    @required this.title,
    @required this.bio,
    @required this.photo,
    @required this.facebook_url,
    @required this.github_url,
    @required this.linkedin_url,
    @required this.email_url,
    @required this.twiter_url,
    @required this.stackoverflow_url,
  }) : super([
          name,
          title,
          bio,
          photo,
          facebook_url,
          github_url,
          linkedin_url,
          email_url,
          twiter_url,
          stackoverflow_url
        ]);*/

  final String quote_desc;
  final String quote_writer;

  Quote({@required this.quote_desc, @required this.quote_writer})
      : super([quote_desc, quote_writer]);
}
