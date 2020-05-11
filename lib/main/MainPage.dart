import 'package:androbi/core/config/Assets.dart';
import 'package:androbi/features/quote/presentation/pages/QuotePage.dart';
import 'package:androbi/main/ContactPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainProvider.dart';
import 'MyAppBar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: Consumer<MainProvider>(
                    builder: (context, model, child) {
                      switch (model.status) {
                        case Pages.Quote:
                          return QuotePage();
                          break;
                        case Pages.Contact:
                          return ContactPage();
                          break;
                        default:
                          return Container();
                          break;
                      }
                    },
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
