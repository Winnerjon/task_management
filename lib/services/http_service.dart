import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_management/models/person_model.dart';

class Network {
  static String BASE = "ads54.herokuapp.com";
  static Map<String,String> headers = {};

  /* Http Apis */

  static String API_PERSON_LIST = "/api/person";

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params =  {};
    return params;
  }

  /* Http Parsing */

  static List<Person> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Person>.from(json.map((x) => Person.fromJson(x)));
    return data;
  }
}