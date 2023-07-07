import 'package:flutter/material.dart';
import 'package:mynotebook/screens/home_screen.dart';

void main() {
  runApp(const MyNoteBook());
}

class MyNoteBook extends StatelessWidget {
  const MyNoteBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Note Book',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
