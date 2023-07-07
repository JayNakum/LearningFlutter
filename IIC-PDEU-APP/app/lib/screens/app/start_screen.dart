import 'package:flutter/material.dart';
import 'package:iic_pdeu/helpers/api.dart';
import '../../models/roles.dart';

import '../../widgets/app/auth_form.dart';

import '../startups/home_screen_startups.dart' as s;
import '../mentors/home_screen_mentors.dart' as m;
import '../admins/home_screen_admins.dart' as a;

class StartScreen extends StatefulWidget {
  static const routeName = '/start';
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  //bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    //setState(() => _isLoading = true);
    API.authenticate().then((response) {
      if (response['role'] == Role.startup) {
        Navigator.of(context).pushReplacementNamed(s.HomeScreen.routeName);
      } else if (response['role'] == Role.mentor) {
        Navigator.of(context).pushReplacementNamed(m.HomeScreen.routeName);
      } else if (response['role'] == Role.admin) {
        Navigator.of(context).pushReplacementNamed(a.HomeScreen.routeName);
      }
    });
  }

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
          // if (_isLoading)
          //   const CircularProgressIndicator()
          // else
          const AuthForm(),
        ],
      ),
    );
  }
}
