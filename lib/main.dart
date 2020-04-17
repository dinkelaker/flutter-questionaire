import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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

  static const questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        { 'text': 'Black', 'score': 10 }, 
        { 'text': 'Red', 'score': 5},
        { 'text': 'Green', 'score': 3},
        { 'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        { 'text': 'Rabbit', 'score': 2 }, 
        { 'text': 'Snake', 'score': 1},
        { 'text': 'Elephant', 'score': 10},
        { 'text': 'Lion', 'score': 5},
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        { 'text': 'Max', 'score': 1 }, 
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Questionaire'),
        ),
        body: _questionIndex < questions.length ? 
            Quiz(questions, _questionIndex, _answerQuestion)
            : 
            Result(_totalScore, _resetQuiz)
      ),
    );
  }

  void _answerQuestion(String answerText, int score) {
    print('For Question "${questions[_questionIndex]['questionText']}": Answer "$answerText" is chosen with score $score.');
    _totalScore += score;
    setState(() => _questionIndex++);
    if (_questionIndex < questions.length) {
      print('We have more questions.');
    } 
  }

  void _resetQuiz() {
    print('Let''s try again');
    _totalScore = 0;
    setState(() => _questionIndex = 0);
  }
}
