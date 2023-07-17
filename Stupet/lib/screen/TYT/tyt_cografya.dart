import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../color/color_theme.dart';
import 'TYT_Dersler.dart';

class tytCografya extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                    MaterialPageRoute(builder: (context) => TYT_Dersler()),
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
        body: FutureBuilder(
          future: fetchDropdownOptions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Veri yüklenirken bir hata oluştu'));
            }
            return QuestionList(
              dropdownOptions: snapshot.data as List<String>,
              textFieldController: _textFieldController,
            );
          },
        ),
      ),
    );
  }

  Future<List<String>> fetchDropdownOptions() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('TYT Coğrafya').get();
    List<String> dropdownOptions = snapshot.docs.map((DocumentSnapshot document) {
      return document.get('konu') as String;
    }).toList();
    return dropdownOptions;
  }
}

class QuestionList extends StatefulWidget {
  final List<String> dropdownOptions;
  final TextEditingController textFieldController;

  QuestionList({required this.dropdownOptions, required this.textFieldController});

  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  List<QuestionWidget> questionWidgets = [];
  List<Map<String, dynamic>> allResults = [];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 5; i++) {
      questionWidgets.add(QuestionWidget(i, widget.dropdownOptions));
    }
    fetchAllResults();
  }

  Future<void> fetchAllResults() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Sonuç TYT Coğrafya').get();
    List<Map<String, dynamic>> results = snapshot.docs.map((DocumentSnapshot document) {
      return document.data() as Map<String, dynamic>;
    }).toList();

    setState(() {
      allResults.addAll(results);
    });
  }

  void analyzeResults() {
    List<Map<String, dynamic>> correctResults = [];

    for (var result in allResults) {
      if (result['Değer'] == '1') {
        correctResults.add({
          'Soru Sayısı': result['Soru Sayısı'],
          'konu': result['konu'],
        });
      }
    }

    print('Doğru İşaretlenmiş Sorular:');
    for (var result in correctResults) {
      print('Soru ${result['Soru Sayısı']}: ${result['konu']}');
    }
  }

  void printAllResults() {
    print('Tüm Sonuçlar:');
    for (var result in allResults) {
      print('Soru ${result['Soru Sayısı']}: ${result['konu']} ${result['Sonuç TYT Coğrafya']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(top: 30)),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Coğrafya Soru Konu Dağılımı',

                style: TextStyle(fontSize: 15.0,color: ColorTheme().khmerCurry),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 30)),
        Expanded(
          child: ListView.builder(
            itemCount: questionWidgets.length,
            itemBuilder: (context, index) {
              return questionWidgets[index];
            },
          ),
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  List<Map<String, dynamic>> resultData = [];

                  for (int i = 0; i < questionWidgets.length; i++) {
                    Map<String, dynamic> result = {
                      'Soru Sayısı': questionWidgets[i].questionNumber,
                      'konu': questionWidgets[i].selectedOption,
                      'Değer': questionWidgets[i].greenButtonSelected ? '1' : '0',
                    };
                    resultData.add(result);
                  }

                  FirebaseFirestore.instance.collection('Sonuç TYT Coğrafya').add({
                    'timestamp': DateTime.now(),
                    'results': resultData,
                    'deneme adı': widget.textFieldController.text,
                  });

                  allResults.addAll(resultData);

                  for (int i = 0; i < questionWidgets.length; i++) {
                    print('Soru ${i + 1}: ${questionWidgets[i].selectedOption} ${questionWidgets[i].greenButtonSelected ? '1' : '0'}');
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Coğrafya Sorularınız Kaydedildi.'),
                    ),
                  );
                },
                child: Text('Kaydet'),
                style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                    minimumSize: Size(100, 40)),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Net Hesapla'),
                style: ElevatedButton.styleFrom(
                    primary: ColorTheme().khmerCurry,
                    onPrimary: Colors.white,
                    minimumSize: Size(100, 40)),
              ),)
          ],
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
  List<String> dropdownOptions;

  QuestionWidget(this.questionNumber, this.dropdownOptions);

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
                color: Colors.black,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.selectedOption,
                items: widget.dropdownOptions.map((option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        option.length > 25
                            ? option.substring(0, 25) + "..."
                            : option,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    widget.selectedOption = value;
                  });
                },
                isExpanded: true,
              ),
            ),
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