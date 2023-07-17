import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/analiz.dart';
import 'package:stupet/screen/kayit.dart';
import 'package:stupet/screen/konuanalizi.dart';

import 'package:stupet/screen/selectedTYT_AYT.dart';
import 'package:stupet/screen/timer.dart';
import 'package:flutter/material.dart';
import 'package:stupet/screen/todo.dart';

import 'cokyakinda.dart';
import 'konuTakip.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {





  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => kayit()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme().backgroundColor,
        leading: null,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().antiqueWhite.withOpacity(0.9),
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Deneme\nVerileri',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => selectedTYT_AYT()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().khmerCurry,
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.auto_graph_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Analiz',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AnalizPage()), //analiz sayfasına bağlanacak
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().khmerCurry,
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'To-do',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => todo()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().antiqueWhite.withOpacity(0.9),
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Geri\nSayım',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TimerPage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().antiqueWhite.withOpacity(0.9),
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.checklist_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Konu\nTakibi',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  KonuTakip()), //analiz sayfasına bağlanacak
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorTheme().khmerCurry,
                        minimumSize: Size(double.infinity, 200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(
                            Icons.question_mark,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Çok\nYakında',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ScrollableCardPage()), //analiz sayfasına bağlanacak
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: ColorTheme().blackbean,
      ),
    );
  }
}