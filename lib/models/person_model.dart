class Person {
  int? id;
  String? username;
  String? password;
  String? fio;
  String? tel;
  bool? status;
  int? role;
  List<Task>? task;

  Person(
      {this.id,
        this.username,
        this.password,
        this.fio,
        this.tel,
        this.status,
        this.role,
        this.task});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    fio = json['fio'];
    tel = json['tel'];
    status = json['status'];
    role = json['role'];
    if (json['task'] != null) {
      task = <Task>[];
      json['task'].forEach((v) {
        task!.add(Task.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['fio'] = fio;
    data['tel'] = tel;
    data['status'] = status;
    data['role'] = role;
    if (task != null) {
      data['task'] = task!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Task {
  int? id;
  String? name;
  String? info;
  String? data;
  bool? status;
  bool? statusTask;
  int? type;

  Task(
      {this.id,
        this.name,
        this.info,
        this.data,
        this.status,
        this.statusTask,
        this.type});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    data = json['data'];
    status = json['status'];
    statusTask = json['status_task'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['info'] = info;
    data['data'] = this.data;
    data['status'] = status;
    data['status_task'] = statusTask;
    data['type'] = type;
    return data;
  }
}


