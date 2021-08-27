import 'package:assessment_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Application',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
