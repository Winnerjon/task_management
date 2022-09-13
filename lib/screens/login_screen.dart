import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:task_management/screens/main_screen.dart';
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
          builder: (ctx, model, child) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage("assets/images/logo.png"),
                            height: 200,
                            width: 200,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GradientText(
                            "Task manager",
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w600),
                            colors: const [
                              Colors.orangeAccent,
                              Colors.grey,
                              Colors.grey,
                              Colors.orange,
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade400,
                            ),
                            child: TextField(
                              controller: controller,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                border: InputBorder.none,
                                hintText: "Parolingizni kiriting",
                                hintStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              model.checkPassword(controller.text);
                              model.isSuccess
                                  ? Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (context) {
                                      return MainScreen(ids: model.persons[model.passwords.indexOf(controller.text)].task!);
                                    }))
                                  : null;
                            },
                              color: const Color(0xFFFFb000),
                            minWidth: 880,
                            height: 45,
                            child: const Text(
                              "Keyingisi",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
