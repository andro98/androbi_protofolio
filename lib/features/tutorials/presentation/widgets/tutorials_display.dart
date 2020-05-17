import 'package:androbi/core/config/Styles.dart';
import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:androbi/main/MainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorialsDisplay extends StatelessWidget {
  final List<Tutorial> tutorials;

  const TutorialsDisplay({Key key, @required this.tutorials}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(tutorials.length, (index) {
        return tutorialCard(tutorials[index], context);
      }),
    );
  }

  Widget tutorialCard(Tutorial tutorial, BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Column(
        children: <Widget>[
          Image.network(
            tutorial.img,
            width: 100.0,
            height: 150.0,
          ),
          FlatButton(
            onPressed: () {
              Provider.of<MainProvider>(context, listen: false)
                  .tutorialsDetailsId = tutorial;
              Provider.of<MainProvider>(context, listen: false)
                  .changeState(Pages.TutorialsDetails);
            },
            child: Container(
              height: 100.0,
              child: SingleChildScrollView(
                child: Text(
                  tutorial.name,
                  style: Styles.yellow20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
