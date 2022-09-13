
import 'package:flutter/cupertino.dart';
import 'package:task_management/models/task_model.dart';

class TaskModel extends ChangeNotifier {
  bool isLoading = false;
  List<Task> tasks = [];

  void apiTaskList() async {
    isLoading = true;
    notifyListeners();
  }
}