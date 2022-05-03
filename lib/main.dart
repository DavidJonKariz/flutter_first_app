import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Index: $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'questionText': "What's your favourite color?",
        'answers': ['Black', 'White', 'Red', 'Green']
      },
      {
        'questionText': "What's your favourite animal?",
        'answers': ['Eagle', 'Lion', 'Elephant', 'Rabbit']
      },
      {
        'questionText': "Who's your favourite instructor?",
        'answers': ['June', 'Pepper', 'Dell', 'Max']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App!'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(_answerQuestion, answer))
                .toList()
          ],
        ),
      ),
    );
  }
}
