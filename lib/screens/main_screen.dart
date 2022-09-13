import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management/screens/task_screen.dart';

class MainScreen extends StatefulWidget {
  final List<int> ids;
  const MainScreen({Key? key,required this.ids}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TaskScreen(ids: widget.ids,),
          Container(
            color: Colors.green,
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {},
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_list), label: "Topshiriqlar"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: "Profil"),
        ],
      ),
    );
  }
}
