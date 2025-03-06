import 'package:flutter/material.dart';
import 'package:flutter_clone2/03-04_test.dart';
import 'package:flutter_clone2/03-06_item.dart';
// import 'package:flutter_clone2/next_screen.dart'; // Ganti dengan halaman tujuan

// void main() => runApp(MyApp06());

// class MyApp06 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Welcome Screen',
//       home: WelcomeScreen(),
//     );
//   }
// }
class splash1 extends StatefulWidget {
  const splash1({super.key});

  @override
  State<splash1> createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double currentPage = 0.0;
  final PageController _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page ?? 0.0;
      });
    });
  }

  List<Widget> indicator() => List<Widget>.generate(
    items.length,
    (index) => Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color:
            currentPage.round() == index
                ? Color(0XFF256075)
                : Color(0XFF256075).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Image.asset(
                        items[index]['image'],
                        fit: BoxFit.fitWidth,
                        width: 220.0,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              items[index]['header'],
                              style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w300,
                                color: Color(0XFF3F3D56),
                                height: 2.0,
                              ),
                            ),
                            Text(
                              items[index]['description'],
                              style: TextStyle(
                                color: Colors.grey,
                                letterSpacing: 1.2,
                                fontSize: 16.0,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // Tambahkan tombol hanya di slide terakhir
                            if (index == items.length - 1)
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xfff8c660),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => testfigma(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Lanjut",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
