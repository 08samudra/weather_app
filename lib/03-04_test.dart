import 'package:flutter/material.dart';
import 'package:flutter_clone2/03-05_test2.dart';
import 'package:flutter_clone2/Service/pref_handler.dart';

class testfigma extends StatefulWidget {
  const testfigma({super.key});

  @override
  _testfigmaState createState() => _testfigmaState();
}

class _testfigmaState extends State<testfigma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/login_screen5.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 400.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "assets/images/logo1.png",
                    alignment: Alignment.center,
                    width: 160,
                    height: 160,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 400, 10, 15),
            child: Row(
              children: [
                Text('Enter your name', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 430, 10, 15),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Jhon Doe',
                hintStyle: TextStyle(color: Colors.white),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(50, 700, 10, 15),
            child: SizedBox(
              height: 50.0,
              width: 300,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xfff8c660),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  PreferenceHandler.saveId('1');
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => test2()));
                },
                child: Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
