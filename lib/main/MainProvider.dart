import 'package:androbi/features/tutorials/domain/entities/tutorial.dart';
import 'package:flutter/material.dart';

enum Pages { Quote, Skills, Experience, Projects, Contact, Tutorials, TutorialsDetails }

class MainProvider extends ChangeNotifier {
  Pages _status;

  Pages get status => _status;

  Tutorial _tutorialsDetailsId;


  Tutorial get tutorialsDetailsId => _tutorialsDetailsId;

  set tutorialsDetailsId(Tutorial value) {
    _tutorialsDetailsId = value;
  }

  MainProvider() {
     _status = Pages.Quote;
  }

  void changeState(Pages page) {
    _status = page;
    notifyListeners();
  }
}
