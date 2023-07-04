import 'package:bootcamp/screen/loginPage.dart';
import 'package:bootcamp/screen/registerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bootcamp F-33',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Login(),
          ],
        ),
      ),
    );
  }
}
