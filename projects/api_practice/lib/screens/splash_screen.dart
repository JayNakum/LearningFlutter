import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<MyProvider>(context, listen: false);
    provider!.fetchAndSetMovies().then((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed('/movies');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network('https://jaynakum.github.io/assets/images/logo.png'),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
