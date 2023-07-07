import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class Ayt_dil_konulari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore User Data Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firestore User Data Demo'),
        ),
        body: Container(
          child: UserDataForm(subject: 'AYT'),
        ),
      ),
    );
  }
}

class UserDataForm extends StatefulWidget {
  final String subject;

  UserDataForm({required this.subject});

  @override
  _UserDataFormState createState() => _UserDataFormState();
}

class _UserDataFormState extends State<UserDataForm> {
  Map<String, bool?> selectedTopics = {};

  Map<String, List<String>> subjectsTopics = {
    'Math': ['Addition', 'Subtraction', 'Multiplication'],
    'Science': ['Biology', 'Chemistry', 'Physics'],
    'History': ['World History', 'American History', 'European History'],
  };

  @override
  void initState() {
    super.initState();
    // Initialize selectedTopics map with null values for each topic
    for (String subject in subjectsTopics.keys) {
      for (String topic in subjectsTopics[subject]!) {
        final topicKey = getTopicKey(subject, topic);
        selectedTopics[topicKey] = null;
      }
    }
  }

  void saveUserData() async {
    final CollectionReference usersCollection = _firestore.collection('users');
    final DocumentReference userDoc = usersCollection.doc(); // Auto-generate a unique document ID

    final Map<String, dynamic> userData = {
      'name': 'kişi',
      'email': 'johndoe@example.com',
      'subjects': {
        for (String subject in subjectsTopics.keys)
          subject.toLowerCase(): {
            'topics': {
              for (String topic in subjectsTopics[subject]!)
                getTopicKey(subject, topic): selectedTopics[getTopicKey(subject, topic)],
            },
          },
      },
    };

    try {
      await userDoc.set(userData);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('User Data Saved'),
          content: Text('User data has been saved to Firestore.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Error saving user data: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String getTopicKey(String subject, String topic) {
    return '${subject.toLowerCase()}_${topic.toLowerCase()}'.replaceAll(' ', '_');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String subject in subjectsTopics.keys)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$subject:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          for (int i = 0; i < subjectsTopics[subject]!.length; i++)
                            buildTopicRow(subject, subjectsTopics[subject]![i]),
                          SizedBox(height: 16.0),
                        ],
                      ),
                    ElevatedButton(
                      onPressed: saveUserData,
                      child: Text('Save User Data'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTopicRow(String subject, String topic) {
    final topicKey = getTopicKey(subject, topic);

    return Row(
      children: [
        Expanded(
          child: Text(
            topic,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 16.0),
        DropdownButtonFormField<bool?>(
          decoration: InputDecoration(
            labelText: 'Value',
          ),
          value: selectedTopics[topicKey],
          items: [
            DropdownMenuItem<bool?>(
              value: true,
              child: Text('True'),
            ),
            DropdownMenuItem<bool?>(
              value: false,
              child: Text('False'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedTopics[topicKey] = value;
            });
          },
        ),
      ],
    );
  }
}
