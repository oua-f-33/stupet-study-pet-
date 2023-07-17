import 'package:flutter/material.dart';
import 'package:stupet/color/color_theme.dart';
import 'package:stupet/screen/homePage.dart';

class ScrollableCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                  MaterialPageRoute(builder: (context) => HomePage()),
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
      body: ListView(
        children: [
          ScrollableCard(
            title: 'Karanlık Mod Desteği',
            content:
            'Uygulamaya karanlık mod desteği eklenerek kullanıcıların göz yorgunluğunu azaltmayı hedefliyoruz.',
            imagePath: 'assets/logo.png',
          ),
          ScrollableCard(
            title: 'GPT Eklentisi',
            content:
            'Uygulamaya GPT desteği eklenerek kullanıcıların çözemediği sorular için daha hızlı cevap alabilmelerini hedefliyoruz.',
            imagePath: 'assets/maskot2.png',
          ),
          ScrollableCard(
            title: 'Not Tutma Desteği',
            content:
            'Uygulamaya not tutmayı seven kullanıcılar için not tutma desteği eklemeyi hedefliyoruz',
            imagePath: 'assets/todo.png',
          ),
          ScrollableCard(
            title: 'Çalışma Arkadaışı Bul',
            content:
            'Uygulamaya rekabeti desteklemek için kullanıcıların başka kullanıcılar ile iletişime geçmesini sağlayacak bir eklenti eklemeyi hedefliyoruz',
            imagePath: 'assets/analyse.png',
          ),
        ],
      ),
    );
  }
}

class ScrollableCard extends StatelessWidget {
  final String title;
  final String content;
  final String imagePath;

  const ScrollableCard({
    required this.title,
    required this.content,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}