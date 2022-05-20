import 'package:flutter/material.dart';
import 'package:iic_pdeu/screens/start_screen.dart';
import 'package:iic_pdeu/screens/auth_screen.dart';
import 'package:iic_pdeu/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IIC PDEU',
      home: const AuthScreen(),
      routes: {
        StartScreen.routeName: (ctx) => const StartScreen(),
        AuthScreen.routeName: (ctx) => const AuthScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },
    );
  }
}
