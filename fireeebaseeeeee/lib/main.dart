import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireeebaseeeeee/selectedTYT_AYT.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp>{

  String selected = "0";
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: selectedTYT_AYT(),
    );
  }

}