import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class TutorialDetailsPage extends StatelessWidget {
  final Tutorial tutorial;

  TutorialDetailsPage(this.tutorial);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50.0),
      child: HtmlWidget(
        tutorial.content,
      ),
    );
  }
}
