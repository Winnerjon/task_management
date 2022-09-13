import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/view_models/task_view_model.dart';

class TaskScreen extends StatefulWidget {
  final List<int> ids;

  const TaskScreen({Key? key, required this.ids}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<String> months = [
    "Yanuar",
    "Fevral",
    "Mart",
    "Aprel",
    "May",
    "Iyun",
    "Iyul",
    "Avgust",
    "Sentyabr",
    "Oktyabr",
    "Noyabr",
    "Dekabr",
  ];
  TaskModel taskModel = TaskModel();

  @override
  void initState() {
    print(widget.ids);
    taskModel.apiTaskList(widget.ids);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: Consumer<TaskModel>(
        builder: (ctx, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                width: 30,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                )),
              ),
              title: Text(
                "Salom, Olimjon Xudoynazarov",
                style: TextStyle(
                    color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      "${months[DateTime.now().month - 1]} ${DateTime.now().year}",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 80,
                          height: MediaQuery.of(context).size.height * 0.8,
                          margin:
                              EdgeInsets.only(left: index != 0?20:0,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFFFb000)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "13",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "Se",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text(
                      "Topshiriqlar",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: model.myTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 2,
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return bottomSheet();
                                },
                              );
                            },
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            title: Text(
                              model.myTasks[index].name!,
                              style: TextStyle(fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              model.myTasks[index].statusTask! ? "Bajarilgan" : "Bajarilmagan",
                              style:
                                  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }


  Widget bottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30)),
      ),
      child: Column(
        children: [

        ],
      ),
    );
  }
}
