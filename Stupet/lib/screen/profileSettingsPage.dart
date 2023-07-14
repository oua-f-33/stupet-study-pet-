import 'package:stupet/screen/profilePage.dart';
import 'package:flutter/material.dart';

import '../color/color_theme.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _fieldController = TextEditingController();
  TextEditingController _goalUniController = TextEditingController();
  TextEditingController _goalMajorController = TextEditingController();
  TextEditingController _goalScoreTYTController = TextEditingController();
  TextEditingController _goalScoreAYTController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text controllers with the current user information
    _nameController.text = 'Kullanıcı Adı';
    _fieldController.text = 'Sayısal';
    _goalUniController.text = 'İstanbul Teknik Üniversitesi';
    _goalMajorController.text = 'Bilgisayar Mühendisliği';
    _goalScoreTYTController.text = '110';
    _goalScoreAYTController.text = '75';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _fieldController.dispose();
    _goalUniController.dispose();
    _goalMajorController.dispose();
    _goalScoreTYTController.dispose();
    _goalScoreAYTController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Save the updated user information here
    String name = _nameController.text;
    String profession = _fieldController.text;
    String goalUni = _goalUniController.text;
    String goalMajor = _goalMajorController.text;
    String goalScoreTYT = _goalScoreTYTController.text;
    String goalScoreAYT = _goalScoreAYTController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Değişiklikler Kaydedildi')),
    );
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
                  MaterialPageRoute(builder: (context) => ProfilePage()),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorTheme().border, // Kenar rengi
                  width: 2, // Kenar kalınlığı
                ),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    'assets/maskot.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'İsim\n',
              ),
            ),
            TextField(
              controller: _fieldController,
              decoration: InputDecoration(
                labelText: 'Alan\n',
              ),
            ),
            const SizedBox(height: 20),
            Text('\nHedefler\n',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              controller: _goalUniController,
              decoration: InputDecoration(
                labelText: 'Hedef Üniversite\n',
              ),
            ),
            TextField(
              controller: _goalMajorController,
              decoration: InputDecoration(
                labelText: 'Hedef Bölüm\n',
              ),
            ),
            TextField(
              controller: _goalScoreTYTController,
              decoration: InputDecoration(
                labelText: 'Hedef TYT Neti',
              ),
            ),
            TextField(
              controller: _goalScoreAYTController,
              decoration: InputDecoration(
                labelText: 'Hedef AYT Neti',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                primary: ColorTheme().khmerCurry, // Butonun arka plan rengi
              ),
              child: Text('Değişiklikleri Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
