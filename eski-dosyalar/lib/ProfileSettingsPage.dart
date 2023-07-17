import 'package:flutter/material.dart';

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
        title: Text('Profil Ayarları'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
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
            Text('\nHedefler\n', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
              child: Text('Değişiklikleri Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
