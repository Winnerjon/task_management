// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

List<Person> personFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  Person({
    required this.id,
    this.username,
    required this.password,
    this.fio,
    this.tel,
    this.status,
    this.role,
    this.task,
  });

  int id;
  String? username;
  String password;
  String? fio;
  String? tel;
  bool? status;
  int? role;
  List<int>? task;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    fio: json["fio"],
    tel: json["tel"],
    status: json["status"],
    role: json["role"],
    task: json["task"] != null? List<int>.from(json["task"].map((x) => x)):null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "fio": fio,
    "tel": tel,
    "status": status,
    "role": role,
    "task": task !=null? List<dynamic>.from(task!.map((x) => x)):null,
  };
}
