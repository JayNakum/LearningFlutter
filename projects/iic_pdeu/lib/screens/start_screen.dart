import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static const routeName = '/start';
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset('assets/images/logo.png'),
          ),
          ElevatedButton(
            autofocus: true,
            onPressed: () {},
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
