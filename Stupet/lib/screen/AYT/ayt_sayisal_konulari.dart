import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/AYT/ayt_biyoloji.dart';
import 'package:stupet/screen/AYT/ayt_fizik.dart';
import 'package:stupet/screen/AYT/ayt_kimya.dart';
import 'package:stupet/screen/AYT/ayt_matematik.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

class aytSayisal extends StatefulWidget {
  const aytSayisal({Key? key}) : super(key: key);
  @override
  State<aytSayisal> createState() => _aytSayisalState();
}

class _aytSayisalState extends State<aytSayisal> {
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
                      MaterialPageRoute(builder: (context) => aytMatematik()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Matematik'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => aytKimya()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Kimya'),
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
                      MaterialPageRoute(builder: (context) => aytFizik()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Fizik'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => aytBiyoloji()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    minimumSize: Size(100, 60),
                  ),
                  child: Text('Biyoloji'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
