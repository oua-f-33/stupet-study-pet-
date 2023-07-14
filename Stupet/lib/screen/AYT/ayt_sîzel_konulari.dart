import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stupet/screen/AYT/ayt_biyoloji.dart';
import 'package:stupet/screen/AYT/ayt_fizik.dart';
import 'package:stupet/screen/AYT/ayt_kimya.dart';
import 'package:stupet/screen/AYT/ayt_matematik.dart';



class aytSozel extends StatefulWidget {
  const aytSozel({Key? key}) : super(key: key);
  @override
  State<aytSozel> createState() => _aytSozelState();
}


class _aytSozelState extends State<aytSozel> {
  String dailyQuote = '';

  @override
  void initState() {
    super.initState();
    getDailyQuote();
  }

  void getDailyQuote() async {
    var collection = FirebaseFirestore.instance.collection('Motivasyon');
    var querySnapshot = await collection.get();
    var totalQuotes = querySnapshot.docs.length;
    var random = Random();
    var randomIndex = random.nextInt(totalQuotes);
    var quote = querySnapshot.docs[randomIndex].get('söz');

    setState(() {
      dailyQuote = quote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top:250)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => aytMatematik()),);
                      },
                      child: Text('Matematik'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => aytKimya()),);
                      },
                      child: Text('Kimya'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => aytBiyoloji()),);
                      },
                      child: Text('Biyoloji'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => aytFizik()),);
                      },
                      child: Text('Fizik'),
                    ),

                  ]
              ),

            ],
          )
      ),
    );
  }
}


