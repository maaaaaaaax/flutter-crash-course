import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "Black", "score": 1},
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Lion", "score": 3},
        {"text": "Tiger", "score": 11},
        {"text": "Bear", "score": 5},
        {"text": "Snek", "score": 9},
      ],
    },
    {
      "questionText": "Who's your favorite president?",
      "answers": [
        {"text": "Barack", "score": 1},
        {"text": "Obama", "score": 1},
        {"text": "President Obama", "score": 1},
        {"text": "Barack Obama", "score": 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Color.fromRGBO(17, 17, 17, 1.0),
        appBar: AppBar(
          title: Text('My First App'),
          // backgroundColor: Color.fromRGBO(25, 25, 25, 1.0),
          // toolbarHeight: 45.0,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
