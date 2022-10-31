// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 200, 174, 88),
//       appBar: AppBar(
//         title: const Text("TO DO"),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           Container(
//             height: 50,
//             color: Colors.amber[600],
//             child: const Center(child: Text('Entry A')),
//           ),
//           Container(
//             height: 50,
//             color: Colors.amber[500],
//             child: const Center(child: Text('Entry B')),
//           ),
//           Container(
//             height: 50,
//             color: Colors.amber[100],
//             child: const Center(child: Text('Entry C')),
//           ),
//           // ToDoTile(),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: deprecated_member_use, prefer_collection_literals
  List todos = [];
  String input = "";

  createTodos() {
    // FirebaseFirestore.instance.collection("MyTOdos").document(input);
    // DocumentReference documentReference= Firestore.instance.collection
  }

  deleteTodos() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 200, 174, 88),
        appBar: AppBar(
          title: const Text("TO DO"),
          centerTitle: true,
          elevation: 0,
        ),
        // ignore: prefer_const_constructors
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color.fromARGB(255, 94, 102, 94),
                    title: const Text(
                      "Add Todo list",
                    ),
                    content: TextFormField(
                      onChanged: ((String value) {
                        input = value;
                      }),
                      decoration:
                          const InputDecoration(hintText: 'Type your new todo'),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Color.fromARGB(255, 157, 220, 11),
                          ),
                        ),
                      ),
                    ],
                  );
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  key: Key(todos[index]),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    shadowColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(
                        color: Colors.red,
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ));
            }));
  }
}
