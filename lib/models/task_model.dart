import 'dart:convert';

List<Task> taskFromJson(String str) => List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  Task({
    required this.id,
    this.name,
    this.info,
    this.data,
    this.status,
    this.statusTask,
    this.type,
  });

  int id;
  String? name;
  String? info;
  DateTime? data;
  bool? status;
  bool? statusTask;
  int? type;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json["id"],
    name: json["name"],
    info: json["info"],
    data: DateTime.parse(json["data"]),
    status: json["status"],
    statusTask: json["status_task"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "info": info,
    "data": data!.toIso8601String(),
    "status": status,
    "status_task": statusTask,
    "type": type,
  };
}
