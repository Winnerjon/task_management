import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_management/models/person_model.dart';
import 'package:task_management/screens/login_screen.dart';
import 'package:task_management/services/http_service.dart';

class LoginModel with ChangeNotifier{
  bool isLoading = false;
  List<Person> persons = [];
  List<String> passwords = [];
  List<int> ids = [];
  bool isSuccess = false;

  void apiPersonList()async{
    isLoading = true;
    notifyListeners();
    
    var response = await Network.GET(Network.API_PERSON_LIST, Network.paramsEmpty());

    if(response != null){
      persons = personFromJson(response);
      notifyListeners();

      for (var element in persons) {
        passwords.add(element.password);
      }
      notifyListeners();

    }
    isLoading = false;
    notifyListeners();
  }

  checkPassword(String password){
    if(passwords.contains(password)){
      isSuccess = true;
      notifyListeners();
    }
  }
}