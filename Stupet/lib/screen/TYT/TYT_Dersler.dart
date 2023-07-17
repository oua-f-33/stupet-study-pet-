import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/TYT/tyt_biyoloji.dart';
import 'package:stupet/screen/TYT/tyt_cografya.dart';
import 'package:stupet/screen/TYT/tyt_din.dart';
import 'package:stupet/screen/TYT/tyt_felsefe.dart';
import 'package:stupet/screen/TYT/tyt_fizik.dart';
import 'package:stupet/screen/TYT/tyt_geometri.dart';
import 'package:stupet/screen/TYT/tyt_kimya.dart';
import 'package:stupet/screen/TYT/tyt_matematik.dart';
import 'package:stupet/screen/TYT/tyt_tarih.dart';
import 'package:stupet/screen/TYT/tyt_turkce.dart';
import 'package:stupet/screen/selectedTYT_AYT.dart';

class TYT_Dersler extends StatefulWidget {
  const TYT_Dersler({Key? key}) : super(key: key);

  @override
  State<TYT_Dersler> createState() => _TYT_DerslerState();
}

class _TYT_DerslerState extends State<TYT_Dersler> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: Center(
          child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 105)),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [

              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytTurkce()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Türkçe ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytMatematik()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Temel Matematik ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ]),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytFizik()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Fizik',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytKimya()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Kimya ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ]),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytBiyoloji()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Biyoloji ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytTarih()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Tarih ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ]),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytCografya()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Coğrafya ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytFelsefe()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Felsefe ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ]),
            Padding(padding: EdgeInsets.only(top: 15)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytGeometri()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Geometri',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              SizedBox(width: 16),
              SizedBox(
                height: 64.0,
                width: 120.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => tytdin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: ColorTheme().antiqueWhite,
                    onPrimary: Colors.white,
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Din Kültürü ve Ahlak Bilgisi ',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
            ]),
          ]),
        ),
      ),
    );
  }
}