import 'package:api_practice2/api_calls.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final API _api = API();

  @override
  void initState() {
    super.initState();
    _api.getAddress('62a880b7056b2f018ee059ea');
    _api.getAllAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('API Practice 2'),
      ),
      body: Center(
        child: Image.network(
          r'https://jaynakum.github.io/assets/images/logo.png',
        ),
      ),
    );
  }
}
