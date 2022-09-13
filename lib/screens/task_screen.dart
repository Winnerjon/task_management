import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  final int id;
  const TaskScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          width: 30,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
              )
          ),
        ),
        title: Text(
          "Salom, Olimjon Xudoynazarov",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
