import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/AYT/ayt_biyoloji.dart';
import 'package:stupet/screen/AYT/ayt_cografya.dart';
import 'package:stupet/screen/AYT/ayt_edebiyat.dart';
import 'package:stupet/screen/AYT/ayt_felsefe.dart';
import 'package:stupet/screen/AYT/ayt_fizik.dart';
import 'package:stupet/screen/AYT/ayt_kimya.dart';
import 'package:stupet/screen/AYT/ayt_matematik.dart';
import 'package:stupet/screen/AYT/ayt_tarih.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

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
                  MaterialPageRoute(builder: (context) => selectedTYT_AYT()),
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
      body: Container(
        height: 500,
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
                      MaterialPageRoute(builder: (context) => aytEdebiyat()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Edebiyat'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => aytTarih()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Tarih-2'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => aytCografya()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Coğrafya'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => aytFelsefe()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Felsefe'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
