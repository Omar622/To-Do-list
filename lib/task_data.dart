import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Data extends ChangeNotifier {
  List<String> taskName = [];
  List<String> taskIsDone = [];

  void add(String textField) {
    taskName.add(textField);
    taskIsDone.add('false');
    notifyListeners();
    saveData();
  }

  void isDone(int i) {
    taskIsDone[i] = (taskIsDone[i] != 'true').toString();
    notifyListeners();
    saveData();
  }

  void delete(int i) {
    taskName.removeAt(i);
    taskIsDone.removeAt(i);
    notifyListeners();
    saveData();
  }

  bool getIsDone(int i) => taskIsDone[i] == 'true';

  void saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    prefs.setStringList("tasksName", taskName);
    prefs.setStringList("tasksIsDone", taskIsDone);
  }

void notify(){
  notifyListeners();
}

}
