import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import './providers/user.dart' as current;
import './screens/app/start_screen.dart';

import './screens/startups/home_screen_startups.dart' as startup;
import './screens/mentors/home_screen_mentors.dart' as mentor;
import './screens/admins/home_screen_admins.dart' as admin;

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => current.User(),
      builder: (context, _) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IIC PDEU',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Color(0xFF8DC73F),
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.red,
          background: Colors.white,
          onBackground: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      home: Phoenix(child: const StartScreen()),
      routes: {
        StartScreen.routeName: (ctx) => const StartScreen(),
        startup.HomeScreen.routeName: (ctx) => const startup.HomeScreen(),
        mentor.HomeScreen.routeName: (ctx) => const mentor.HomeScreen(),
        admin.HomeScreen.routeName: (ctx) => const admin.HomeScreen(),
      },
    );
  }
}
