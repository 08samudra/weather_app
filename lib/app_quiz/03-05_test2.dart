import 'package:flutter/material.dart';
import 'package:flutter_clone2/app_quiz/03-04_test.dart';
import 'package:flutter_clone2/app_quiz/03-05_test4.dart';
import 'package:flutter_clone2/app_quiz/03-06_splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_clone2/login_page.dart'; // Ganti dengan halaman login kamu

class test2 extends StatefulWidget {
  _test2 createState() => _test2();
}

class _test2 extends State<test2> {
  int selected = -1;

  List<int> options = [2000, 2025, 2023, 2024];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(context),
              _buildCardQuestion(),
              SizedBox(height: 40),
              Expanded(child: _buildOption()),
              DefaultButton(
                backgroundColor: Color(0xff004643),
                text: "Finish",
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.clear(); // Hapus data session pengguna

                  // Arahkan ke halaman login
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                    (route) => false,
                  );
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  ListView _buildOption() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: options.length,
      itemBuilder: (BuildContext context, int index) {
        int option = options[index];
        bool isSelected = selected == index;
        return GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
            });
            print("Selected: $selected");
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xffABD1C6) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  option.toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                    color: Color(0xff004643),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Stack _buildCardQuestion() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 75),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha((255.0 * 0.15).round()),
                spreadRadius: -10,
                blurRadius: 50,
                offset: Offset(0, 20),
              ),
            ],
          ),
          width: double.infinity,
          height: 229,
          child: Center(
            child: Text(
              "Tahun berapa saat ini?",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 85,
                    width: 85,
                    child: CircularProgressIndicator(
                      value: 0.5,
                      strokeWidth: 8,
                      backgroundColor: Color(0xffABD1C6),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xff004643),
                      ),
                    ),
                  ),
                  Text(
                    "30",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff004643),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, size: 12),
                  Text(
                    "Previous",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
        Text(
          "7/10",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
