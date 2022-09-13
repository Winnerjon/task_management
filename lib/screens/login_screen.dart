import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/view_models/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginModel loginModel = LoginModel();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginModel.apiPersonList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => loginModel,
        child: Consumer<LoginModel>(
          builder: (ctx,model,child){
            return Scaffold(
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: double.infinity,
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(""),
                //   ),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        model.checkPassword(controller.text);
                        // model.isSuccess?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
                        //   return HomeScreen();
                        // })):null;
                      },
                      color: Colors.blue,
                      child: const Text("Next"),
                    ),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
