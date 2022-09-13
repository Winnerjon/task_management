import 'package:flutter/cupertino.dart';
import 'package:task_management/services/http_service.dart';

class LoginModel with ChangeNotifier{
  bool isLoading = false;
  List persons = [];

  void apiPersonList()async{
    isLoading = true;
    notifyListeners();
    
    var response = await Network.GET(Network.API_PERSON_LIST, Network.paramsEmpty());
  }
}