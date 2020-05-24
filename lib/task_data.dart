import 'package:flutter/material.dart';
import 'task.dart';

class Data extends ChangeNotifier {
  final List<Task> tasks = [];

  void add(String textField) {
    tasks.add(Task(name: textField));
    notifyListeners();
  }
  void isDone(int i){
    tasks[i].isDone = !tasks[i].isDone;
    notifyListeners();
  }
  void delete(int i){
    tasks.removeAt(i);
    notifyListeners();
  }
}