import 'package:flutter/material.dart';

class parsing1 extends StatelessWidget {
  const parsing1({super.key, required this.data});
  final String data;

  // bool _isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hasil Parsing dan TabBar"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: "Car"),
              Tab(icon: Icon(Icons.directions_transit), text: "Train"),
              Tab(icon: Icon(Icons.directions_bike), text: "Bike"),
              Tab(icon: Icon(Icons.directions_boat_rounded), text: "Boat"),
              Tab(icon: Icon(Icons.directions_bus), text: "Bus"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Hasil : $data")),
            Center(child: Text("Tab 2 Content")),
            Center(child: Text("Tab 3 Content")),
            Center(child: Text("Tab 4 Content")),
            Center(child: Text("Tab 5 Content")),
          ],
        ),
      ),
    );
  }

  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       appBar: AppBar(title: const Text("Halaman Kedua")),
  //       body: Center(child: Text("Hasil : $data")),
  //     );
  //   }
  // }
}
