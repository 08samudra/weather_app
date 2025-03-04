import 'package:flutter/material.dart';
import 'package:flutter_clone2/03-03_login.dart';
import 'package:flutter_clone2/02-28_login2.dart';
import 'package:flutter_clone2/03-03_parsing_TabBar1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const LoginScreen(),
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObsecure = false;
  bool _isActive = true;
  TextEditingController controllerData = TextEditingController();
  // final TextEditingController _emailcontorller = TextEditingController();
  // final TextEditingController _phonecontroller = TextEditingController();
  // final TextEditingController_passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_screen3.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Welcome To Facebook",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // SizedBox(height: 15),
                        // Icon(
                        //   Icons.facebook,
                        //   size: 50,
                        //   color: const Color.fromARGB(255, 8, 8, 8),
                        // ),
                        space(),
                        Text(
                          "Login to access your account",
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 3, 3, 3),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                space(height: 24),
                titleField("Email Address"),
                space(),
                textFieldConst(hintText: "Enter Email"),
                space(),
                titleField("Phone Number"),
                space(),
                textFieldConst(hintText: "Enter Phone Number"),
                space(height: 16),
                titleField("Password"),
                space(height: 16),
                textFieldConst(hintText: "Enter Password", isPassword: true),

                space(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password",
                      style: TextStyle(color: Color.fromARGB(255, 255, 56, 1)),
                    ),
                  ],
                ),
                space(),
                Column(
                  children: [
                    GestureDetector(
                      onTap:
                          _isActive
                              ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => LoginScreen2(
                                          data: controllerData.text,
                                        ),
                                  ),
                                );
                              }
                              : null,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff283FB1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                space(height: 24),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(controller: controllerData),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      parsing1(data: controllerData.text),
                            ),
                          );
                        },
                        child: const Text('Mengirim Data'),
                      ),
                    ],
                  ),
                ),
                space(height: 24),
                GestureDetector(
                  onTap:
                      _isActive
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen3(),
                              ),
                            );
                          }
                          : null,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/google.png", height: 16),
                        SizedBox(width: 8),
                        Text("Google", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
                space(height: 24),
                RichText(
                  text: TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Color(0xff283FB1),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox space({double height = 12}) => SizedBox(height: height);

  TextField textFieldConst({String? hintText, bool isPassword = false}) =>
      TextField(
        obscureText:
            isPassword
                ? _isObsecure
                : false, //mengatur melihat atau tidak password yang di input
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon:
              isPassword
                  ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObsecure = !_isObsecure;
                      });
                    },
                    icon: Icon(
                      _isObsecure ? Icons.visibility_off : Icons.visibility,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                  : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        ),
      );

  Widget titleField(String text) => Row(
    children: [
      Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    ],
  );
}
