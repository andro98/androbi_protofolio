import 'package:flutter/material.dart';

enum Pages { Quote, Skills, Experience, Projects, Contact }

class MainProvider extends ChangeNotifier {
  Pages _status;

  Pages get status => _status;

  MainProvider() {
     _status = Pages.Quote;
  }

  void changeState(Pages page) {
    _status = page;
    notifyListeners();
  }
}
