import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String title = "Flutter Web Movie";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '$title',
      home: Home(title: "$title"),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        primaryColor: Colors.red,
        accentColor: Colors.redAccent,
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}
