import 'package:stupet/screen/analiz.dart';
import 'package:flutter/material.dart';

class AnalizPage extends StatefulWidget {
  const AnalizPage({Key? key}) : super(key: key);

  @override
  State<AnalizPage> createState() => _AnalizPageState();
}

class _AnalizPageState extends State<AnalizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Analiz'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/logo/logo.png'),
            ),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                  color: Color(0xFFEFB07D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnalizPageExamKonu()));
                  },
                  child: Text(
                    "Konu Analizi",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 160,
                decoration: BoxDecoration(
                  color: Color(0xFFEFB07D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AnalizPageExamKonu()));
                  },
                  child: Text(
                    "Net Analizi",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}