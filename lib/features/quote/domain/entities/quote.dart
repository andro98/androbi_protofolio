import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Quote extends Equatable {
  final String quote_desc;
  final String quote_writer;

  Quote({@required this.quote_desc, @required this.quote_writer})
      : super([quote_desc, quote_writer]);
}
