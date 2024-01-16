import 'package:client_portal/model/tutorial_model.dart';
import 'package:client_portal/service/tutorial_service.dart';
import 'package:flutter/material.dart';

class TutorialProvider with ChangeNotifier {
  List<TutorialModel> _tutorials = [];
  List<TutorialModel> get tutorials => _tutorials;

  set tutorials(List<TutorialModel> tutorials) {
    _tutorials = tutorials;
    notifyListeners();
  }

  Future<void> getTutorials() async {
    try {
      List<TutorialModel> tutorials = await TutorialService().getTutorials();
      _tutorials = tutorials;
    } catch (e) {
      print(e);
    }
  }
}
