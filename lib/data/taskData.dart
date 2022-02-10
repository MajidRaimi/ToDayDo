import 'package:flutter/material.dart';
import '/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];

  late Color? mainColor = Colors.red;

  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeIsDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void changeColor(Color newMainColor) {
    mainColor = newMainColor;
    notifyListeners();
  }
}
