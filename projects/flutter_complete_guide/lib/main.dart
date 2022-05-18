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
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {'text': "Blue", 'score': 1},
        {'text': "Black", 'score': 4},
        {'text': "Red", 'score': 3},
        {'text': "Green", 'score': 2},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {'text': "Cat", 'score': 1},
        {'text': "Dog", 'score': 1},
        {'text': "Rabbit", 'score': 3},
        {'text': "Squirrel", 'score': 4},
      ]
    },
    {
      "questionText": "Who's your favourite instructor",
      "answers": [
        {'text': "Max", 'score': 1},
        {'text': "Max", 'score': 1},
        {'text': "Max", 'score': 1},
        {'text': "Max", 'score': 1},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestions(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No questions left!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First Flutter App'),
      ),
      body: (_questionIndex < _questions.length)
          ? Quiz(
              answerQuestions: _answerQuestions,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
