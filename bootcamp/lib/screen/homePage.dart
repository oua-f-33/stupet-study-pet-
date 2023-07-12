import 'package:bootcamp/color/color_theme.dart';
import 'package:bootcamp/screen/profilePage.dart';
import 'package:bootcamp/screen/timer.dart';
import 'package:flutter/material.dart';

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
          MaterialPageRoute(builder: (context) => ProfilePage()),
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
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showPopup();
    });
  }

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Zeliha buraya motivasyon sözü pls :D'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('✅'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                                  TimerPage()), //analiz sayfasına bağlanacak
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
                                  TimerPage()), //konutakip sayfasına bağlanacak
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
                          MaterialPageRoute(
                              builder: (context) =>
                                  TimerPage()), // To-do sayfasına bağlanacak
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
                            Icons.question_mark_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Çok\nYakında',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {},
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
                            Icons.question_mark_outlined,
                            size: 30,
                          ), // İstediğiniz bir icon
                          SizedBox(width: 8.0),
                          Text(
                            'Çok\nYakında',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      onPressed: () {},
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
