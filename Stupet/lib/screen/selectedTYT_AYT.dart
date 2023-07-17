import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/AYT/ayt_s%C3%AEzel_konulari.dart';
import 'package:stupet/screen/homePage.dart';

import 'AYT/ayt_dil_konulari.dart';
import 'AYT/ayt_esit_agirlik_konulari.dart';
import 'AYT/ayt_sayisal_konulari.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.75),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              color: ColorTheme().blackbean,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
          ],
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TYT_Dersler()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorTheme().khmerCurry,
                  minimumSize: Size(80, 60),
                ),
                child: Text('TYT'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aytSayisal()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorTheme().antiqueWhite,
                  minimumSize: Size(80, 60),
                ),
                child: Text('AYT-SAY'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aytSozel()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorTheme().khmerCurry,
                  minimumSize: Size(80, 60),
                ),
                child: Text('AYT-SÖZ'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aytEsitAgirlik()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorTheme().antiqueWhite,
                  minimumSize: Size(80, 60),
                ),
                child: Text('AYT-EA'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aytDil()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorTheme().khmerCurry,
                  minimumSize: Size(80, 60),
                ),
                child: Text('YDT'),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 150)),
          Text(
            textAlign: TextAlign.center,
            dailyQuote,
            style: TextStyle(
                fontStyle: FontStyle.italic, fontSize: 14, color: Colors.grey),
          ),
        ],
      )),
    );
  }
}
