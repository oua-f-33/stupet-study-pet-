import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stupet/screen/homePage.dart';

import '../color/color_theme.dart';
import 'TYT/TYT_Dersler.dart';

class vericekme extends StatelessWidget {
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
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('results').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Hata: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Yükleeniyor...');
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('Veri yok.');
          }

          List<Map<String, dynamic>> incorrectAnswers = []; // Yanlış yapılan soruların listesi
          List<Map<String, dynamic>> analysisResults = []; // Analiz edilen sonuçların listesi

          // Tüm dökümanlardaki sonuçları dolaşarak yanlış yapılan soruları bul
          snapshot.data!.docs.forEach((DocumentSnapshot<Map<String, dynamic>> document) {
            List<Map<String, dynamic>> results = List<Map<String, dynamic>>.from(document.data()!['results'] ?? []);

            results.forEach((result) {
              int? questionNumber = (result['Soru Sayısı'] as int?) ?? 0;
              String? resultValue = result['Değer']?.toString();
              String? selectedOption = result['konu'] as String?;

              if (resultValue == '0') {
                // resultValue değeri 0 olanları yanlış yapılan sorulara ekle
                incorrectAnswers.add({
                  'question': 'Soru: $questionNumber',
                  'konu': 'Konu: $selectedOption',
                });
              }
            });
          });

          // Yanlış yapılan soruları analiz et ve aynı seçeneklere sahip olan soruları bul
          incorrectAnswers.forEach((incorrectAnswer) {
            String? selectedOption = incorrectAnswer['konu'] as String?;
            int count = incorrectAnswers
                .where((answer) => answer['konu'] == selectedOption)
                .toList()
                .length;

            // Analiz sonuçlarını ekleyerek toplam sayıyı tut
            if (count > 3 && !analysisResults.any((result) => result['konu'] == selectedOption)) {
              analysisResults.add({
                'konu': selectedOption,
                'count': count,
              });
            }
          });

          return ListView(
            children: [
              ListTile(
                title: Text('Yanlış Yapılan Sorular'),
              ),
              ...incorrectAnswers.map((answer) => ListTile(
                title: Text(answer['question'] ?? ''),
                subtitle: Text(answer['konu'] ?? ''),
              )),
              ListTile(
                title: Text('Analiz Sonucu'),
              ),
              ...analysisResults.map((result) {
                final selectedOption = result['konu'] as String?;
                final count = result['count'] as int?;

                if (count != null && count > 2) {
                  return ListTile(
                    title: Text('Üçden fazla yanlış yaptığın konular:.'),
                    subtitle: Text(selectedOption ?? ''),
                  );
                } else {
                  return ListTile(
                    title: Text('Selected Option: $selectedOption'),
                    subtitle: Text('Count: $count'),
                  );
                }
              }),
            ],
          );
        },
      ),
    );
  }
}