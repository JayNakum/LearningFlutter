import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 3) {
      resultText = "You're awsome and innocent!!";
    } else if (resultScore <= 5) {
      resultText = "Pretty likeable!";
    } else if (resultScore <= 7) {
      resultText = "You're Strange!";
    } else {
      resultText = "You're so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      FlatButton(
        child: Text(
          'Restart Quiz!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        textColor: Colors.blue,
        onPressed: resetHandler,
      )
    ]));
  }
}
