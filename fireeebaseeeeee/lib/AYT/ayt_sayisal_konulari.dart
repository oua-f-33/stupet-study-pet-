import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ayt_sayisal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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

  @override
  void initState() {
    super.initState();
    fetchDropdownOptions();
    for (int i = 1; i <= 40; i++) {
      questionWidgets.add(QuestionWidget(i));
    }
  }

  Future<void> fetchDropdownOptions() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('TYT').get();
    List<String> dropdownOptions = snapshot.docs.map((DocumentSnapshot document) {
      return document.get('name') as String;
    }).toList();

    setState(() {
      for (var questionWidget in questionWidgets) {
        questionWidget.dropdownOptions = dropdownOptions;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top:80,)),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Sayısal Soru Konu Dağılımı',
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
        Padding(padding: EdgeInsets.only(top:55,)),
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
            for (int i = 0; i < questionWidgets.length; i++) {
              print('Soru ${i + 1}: ${questionWidgets[i].selectedOption} ${questionWidgets[i].greenButtonSelected ? '1' : '0'}');
            }
          },
          child: Text('Sonuçları Göster'),
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
              'Soru${widget.questionNumber}',
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
          IconButton(
            onPressed: () {
              setState(() {
                textBackgroundColor = Colors.white;
                widget.greenButtonSelected = false;
                widget.redButtonSelected = false;
              });
            },
            icon: Icon(Icons.restore, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}