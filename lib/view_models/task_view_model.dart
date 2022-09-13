
import 'package:flutter/cupertino.dart';
import 'package:task_management/models/task_model.dart';
import 'package:task_management/services/http_service.dart';

class TaskModel extends ChangeNotifier {
  bool isLoading = false;
  List<Task> tasks = [];
  List<Task> myTasks = [];

  void apiTaskList(List<int> list) async {
    isLoading = true;
    notifyListeners();

    var response = await Network.GET(Network.API_TASK_LIST, Network.paramsEmpty());

    if(response != null){
      tasks = taskFromJson(response);
      notifyListeners();
      myTask(list);
    }
  }

  void myTask(List<int> list) {
    print(tasks);
    for(var id in list) {
      A:
      for(var task in tasks) {
        if(id == task.id) {
          myTasks.add(task);
          break A;
        }
      }
    }
    print("MyTasks: ${myTasks}");
    isLoading = false;
    notifyListeners();
  }
}