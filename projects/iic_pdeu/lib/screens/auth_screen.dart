import 'package:flutter/material.dart';
import 'package:iic_pdeu/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (isSignUp)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Name'),
                    // hintText: 'Enter Your Full Name',
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                  // hintText: 'Enter Your Email',
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Password'),
                  // hintText: 'Enter Your Password',
                  border: OutlineInputBorder(),
                  filled: true,
                ),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  isSignUp = !isSignUp;
                });
              },
              child: isSignUp
                  ? const Text('Sign in instead?')
                  : const Text('Sign up instead?'),
            ),
            ElevatedButton(
              autofocus: true,
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
              child: isSignUp ? const Text('Sign up') : const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
