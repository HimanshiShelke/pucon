import 'package:flutter/material.dart';
import 'package:pucon/home.dart';
//import 'package:pucon/home.dart';
import 'package:pucon/insert.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Venue(),
    );
  }
}
