import 'package:flutter/material.dart';
import 'package:stupet/screen/TYT/tyt_biyoloji.dart';
import 'package:stupet/screen/TYT/tyt_cografya.dart';
import 'package:stupet/screen/TYT/tyt_din.dart';
import 'package:stupet/screen/TYT/tyt_felsefe.dart';
import 'package:stupet/screen/TYT/tyt_fizik.dart';
import 'package:stupet/screen/TYT/tyt_kimya.dart';
import 'package:stupet/screen/TYT/tyt_matematik.dart';
import 'package:stupet/screen/TYT/tyt_tarih.dart';
import 'package:stupet/screen/TYT/tyt_turkce.dart';



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
        body: Center(
          child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top:205)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytTurkce()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytMatematik()),);

                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightGreen,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Temel Matematik ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ]
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytFizik()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Fizik',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytKimya()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Kimya ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ]
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytBiyoloji()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Biyoloji ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytTarih()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Tarih ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ]
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytCografya()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Coğrafya ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytFelsefe()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Felsefe ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                    ]
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => tytDin()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Din Kültürü ve Ahlak Bilgisi ',
                            style: TextStyle(fontSize: 16.0, ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),

                    ]
                ),

              ]
          ),
        ),
      ),
    );
  }
}
