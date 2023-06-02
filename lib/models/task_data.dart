import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_flutter/models/task.dart';

class TaskData with ChangeNotifier {
  //made tasks private with _
  List<Task> _tasks = [
    Task(name: 'Task1'),
    Task(name: 'Task2'),
    Task(name: 'Task3'),
  ];

  //getter
  int get taskCount {
    return _tasks.length;
  }

  //getter. This is not a ListView. This is an untouchable List [].
  //for safety. Not to modify tasks easily from outside of this dart.file
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.changeBoolValue();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
