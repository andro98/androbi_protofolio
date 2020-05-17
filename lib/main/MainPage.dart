import 'package:androbi/core/config/Assets.dart';
import 'package:androbi/features/experience/presentation/pages/ExperiencePage.dart';
import 'package:androbi/features/quote/presentation/pages/QuotePage.dart';
import 'package:androbi/features/skills/presentation/pages/SkillPage.dart';
import 'package:androbi/features/tutorials/presentation/pages/TutorialDetailsPage.dart';
import 'package:androbi/features/tutorials/presentation/pages/TutorialPage.dart';
import 'package:androbi/main/ContactPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainProvider.dart';
import 'MyAppBar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => MainProvider(),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: MyAppBar(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.backgrounImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.all(50.0),
                    height: size.height,
                    width: size.width,
                    child: Consumer<MainProvider>(
                      builder: (context, model, child) {
                        switch (model.status) {
                          case Pages.Quote:
                            return QuotePage();
                            break;
                          case Pages.Skills:
                            return SkillPage();
                            break;
                          case Pages.Experience:
                            return ExperiencePage();
                            break;
                          case Pages.Contact:
                            return ContactPage();
                            break;
                          case Pages.Tutorials:
                            return TutorialPage();
                            break;
                          case Pages.TutorialsDetails:
                            return TutorialDetailsPage(
                                model.tutorialsDetailsId);
                          default:
                            return Container();
                            break;
                        }
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
