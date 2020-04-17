import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    var resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome with your total score of $resultScore.';
    } else if (resultScore <= 12) {
      resultText = 'You are pretty likeable with your total score of $resultScore.';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange  with your total score of $resultScore.';
    } else {
      resultText = 'You are so bad with your total score of $resultScore.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text('Restart quiz'), onPressed: resetQuiz,)
        ],
      ),
    );
  }

}