// import 'package:flutter/material.dart';
// import 'package:flutter_clone2/Service/noteDbHelper.dart';

// class NoteHome extends StatefulWidget {
//   const NoteHome({super.key});

//   @override
//   State<NoteHome> createState() => _NoteHomeState();
// }

// class _NoteHomeState extends State<NoteHome> {
  
//   insertdatabase(tittle, description) {}

//   updatedatabase(snap, index, tittle, description) {}
  
//   deletedatabase(snap, index) {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: MediaQuery.of(context).size.height * 0.7,
//         title: const Text('Note App')),
//       body: Padding(padding: EdgeInsets.all(8),
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.8,
//         child: FutureBuilder(
//           future: NoteDbHelper.instance.queryAll(),
//           builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snap) {
//             if (snap.hasData) {
//               return ListView.builder(
//                 itemCount: snap.data!.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       title: Text(snap.data[index][NoteDbHelper.coltitle]),
//                       subtitle: Text(
//                         snap.data![index][NoteDbHelper.coldescription]),
//                         trailing: Text (snap.data![index][NoteDbHelper.coldate]),
//                          .toString()
//                          .substring(0, 10),
//                     ),
//                   );
//                 }
//                 );
//             }
//           }
//         )
//       ),)
//     );
//   }
// }
