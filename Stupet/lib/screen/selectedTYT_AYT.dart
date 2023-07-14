import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'AYT/ayt_dil_konulari.dart';
import 'AYT/ayt_esit_agirlik_konulari.dart';
import 'AYT/ayt_sayisal_konulari.dart';
import 'AYT/ayt_sözel_konulari.dart';
import 'TYT/TYT_Dersler.dart';



class selectedTYT_AYT extends StatefulWidget {
  const selectedTYT_AYT({Key? key}) : super(key: key);
  @override
  State<selectedTYT_AYT> createState() => _selectedTYT_AYTState();
}


class _selectedTYT_AYTState extends State<selectedTYT_AYT> {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TYT_Dersler()),);
                    },
                    child: Text('TYT'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => aytSayisal()),);
                    },
                    child: Text('AYT-SAY'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => aytSozel()),);
                    },
                    child: Text('AYT-SÖZ'),
                  ),

                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => aytEsitAgirlik()),);
                    },
                    child: Text('AYT-EA'),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => aytDil()),);
                    },
                    child: Text('YDT'),
                  ),

                ]
            ),
            Padding(padding: EdgeInsets.only(top:100)),
            Text(
              textAlign: TextAlign.center,
              dailyQuote,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: Colors.grey),
            ),
          ],
        )
      ),
    );
  }
}


