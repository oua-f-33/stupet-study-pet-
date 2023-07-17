import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class tytdin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sorular'),
        ),
        body: QuestionList(),
      ),
    );
  }
}

class QuestionList extends StatefulWidget {
  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<QuestionWidget> questionWidgets = [];
  List<Map<String, dynamic>> allResults = [];

  @override
  void initState() {
    super.initState();
    fetchDropdownOptions();
    for (int i = 1; i <= 40; i++) {
      questionWidgets.add(QuestionWidget(i));
    }
    fetchAllResults();
  }

  Future<void> fetchDropdownOptions() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('TYT Turkce').get();
    List<String> dropdownOptions = snapshot.docs.map((DocumentSnapshot document) {
      return document.get('konu') as String;
    }).toList();

    setState(() {
      for (var questionWidget in questionWidgets) {
        questionWidget.dropdownOptions = dropdownOptions;
      }
    });
  }

  Future<void> fetchAllResults() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Sonuc Deneme').get();
    List<Map<String, dynamic>> results = snapshot.docs.map((DocumentSnapshot document) {
      return document.data() as Map<String, dynamic>;
    }).toList();

    setState(() {
      allResults.addAll(results);
    });
  }

  void analyzeResults() {
    List<Map<String, dynamic>> correctResults = [];
    List<Map<String, dynamic>> wrongResults = [];

    for (var result in allResults) {
      if (result['result'] == '1') {
        correctResults.add({
          'questionNumber': result['questionNumber'],
          'selectedOption': result['selectedOption'],
        });
      } else {
        wrongResults.add({
          'questionNumber': result['questionNumber'],
          'selectedOption': result['selectedOption'],
        });
      }
    }

    print('Doğru İşaretlenmiş Sorular:');
    for (var result in correctResults) {
      print('Soru ${result['questionNumber']}: ${result['selectedOption']}');
    }

    print('Yanlış İşaretlenmiş Sorular:');
    for (var result in wrongResults) {
      print('Soru ${result['questionNumber']}: ${result['selectedOption']}');
    }
  }

  void printAllResults() {
    print('Tüm Sonuçlar:');
    for (var result in allResults) {
      print('Soru ${result['questionNumber']}: ${result['selectedOption']} ${result['result']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: questionWidgets.length,
            itemBuilder: (context, index) {
              return questionWidgets[index];
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            List<Map<String, dynamic>> resultData = [];

            for (int i = 0; i < questionWidgets.length; i++) {
              Map<String, dynamic> result = {
                'questionNumber': questionWidgets[i].questionNumber,
                'selectedOption': questionWidgets[i].selectedOption,
                'result': questionWidgets[i].greenButtonSelected ? '1' : '0',
              };
              resultData.add(result);
            }

            FirebaseFirestore.instance.collection('Sonuc Deneme').add({
              'timestamp': DateTime.now(),
              'results': resultData,
            });

            allResults.addAll(resultData);

            for (int i = 0; i < questionWidgets.length; i++) {
              print('Soru ${i + 1}: ${questionWidgets[i].selectedOption} ${questionWidgets[i].greenButtonSelected ? '1' : '0'}');
            }
          },
          child: Text('Sonuçları Göster'),
        ),
        ElevatedButton(
          onPressed: () {
            analyzeResults();
          },
          child: Text('Doğru İşaretlenmiş Soruları Göster'),
        ),
        ElevatedButton(
          onPressed: () {
            List<Map<String, dynamic>> wrongResults = allResults.where((result) => result['result'] == '0').toList();

            print('Yanlış İşaretlenmiş Sorular:');
            for (var result in wrongResults) {
              print('Soru ${result['questionNumber']}: ${result['selectedOption']}');
            }
          },
          child: Text('Yanlış İşaretlenmiş Soruları Göster'),
        ),
      ],
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final int questionNumber;
  String? selectedOption;
  bool greenButtonSelected = false;
  bool redButtonSelected = false;
  List<String> dropdownOptions = [];

  QuestionWidget(this.questionNumber);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  Color textBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: textBackgroundColor,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Soru ${widget.questionNumber}',
              style: TextStyle(
                color: widget.greenButtonSelected ? Colors.green : Colors.black,
              ),
            ),
          ),
          DropdownButton<String>(
            value: widget.selectedOption,
            items: widget.dropdownOptions.map((option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                widget.selectedOption = value;
              });
            },
          ),
          IconButton(
            onPressed: () {
              setState(() {
                textBackgroundColor = Colors.green;
                widget.greenButtonSelected = true;
                widget.redButtonSelected = false;
              });
            },
            icon: Icon(Icons.check, color: Colors.green),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                textBackgroundColor = Colors.red;
                widget.greenButtonSelected = false;
                widget.redButtonSelected = true;
              });
            },
            icon: Icon(Icons.close, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
