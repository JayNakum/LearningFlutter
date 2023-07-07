import 'package:flutter/material.dart';
import 'package:iic_pdeu/helpers/api.dart';
import 'package:iic_pdeu/models/getstartdetails.dart';
import 'package:iic_pdeu/providers/user.dart';
import 'package:provider/provider.dart';

import '../../models/roles.dart';
import '../../screens/startups/home_screen_startups.dart' as startup;
import '../../screens/mentors/home_screen_mentors.dart' as mentor;
import '../../screens/admins/home_screen_admins.dart' as a;

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //final API _api = API();
  bool _isLoading = false;
  final _userEmail = TextEditingController();
  final _userPassword = TextEditingController();

  void _trySubmit() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    try {
      API
          .login(
            username: _userEmail.text.trim(),
            password: _userPassword.text.trim(),
          )
          .then(
            (_) => API.authenticate().then((response) {
              if (response['role'] == Role.startup) {
                final user = Provider.of<User>(context, listen: false);
                user.role = Role.startup;
                API
                    .getStartUpDetails(response['username'])
                    .then((value) => user.startupDetails = value)
                    .then((_) => Navigator.of(context)
                        .pushReplacementNamed(startup.HomeScreen.routeName));
              } else if (response['role'] == Role.mentor) {
                final user = Provider.of<User>(context, listen: false);
                user.role = Role.mentor;
                API
                    .getMentorDetails(response['username'])
                    .then((value) => user.mentorDetails = value)
                    .then((_) => Navigator.of(context)
                        .pushReplacementNamed(mentor.HomeScreen.routeName));
              } else if (response['role'] == Role.admin) {
                final user = Provider.of<User>(context, listen: false);
                user.role = Role.admin;
                API
                    .getAdminDetails(response['username'])
                    .then((value) => user.adminDetails = value)
                    .then((_) => Navigator.of(context)
                        .pushReplacementNamed(a.HomeScreen.routeName));
              }
            }),
          );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _userEmail,
              decoration: const InputDecoration(
                label: Text('Username'),
                // hintText: 'Enter Your Username',
                border: OutlineInputBorder(),
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _userPassword,
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
          // TextButton(
          //   onPressed: () {},
          //   child: const Text('Forgot Password?'),
          // ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  autofocus: true,
                  onPressed: _trySubmit,
                  child: const Text('Jump In'),
                ),
        ],
      ),
    );
  }
}
