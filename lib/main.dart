import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name
      title: 'Todo list application',
      theme: ThemeData(
        // primarySwatch: Colors.yellow,
        // ignore: deprecated_member_use
        accentColor: Colors.redAccent,
      ),
      home: const MyHomePage(),
    );
  }
}
