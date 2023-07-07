
import 'package:fireeebaseeeeee/TYT/sosyal_bilimler_konulari.dart';
import 'package:fireeebaseeeeee/TYT/turkce_konulari.dart';
import 'package:flutter/material.dart';


import 'fen_bilimleri_konulari.dart';
import 'matematik_konulari.dart';


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
                Padding(padding: EdgeInsets.only(top:305)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 64.0,
                        width: 120.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Turkce_Konulari()),);
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Matematik_Konulari()),);

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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Sosyal_Bilimler()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amberAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Sosyal Bilimler ',
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Fen_bilimleri()),);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purpleAccent,
                            onPrimary: Colors.white,
                          ),
                          child: Text(
                            textAlign: TextAlign.center,
                            'Fen Bilimleri ',
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
