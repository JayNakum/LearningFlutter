import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import '../widgets/movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MyProvider>(context, listen: false).movies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: MoviesList(movies: movies),
    );
  }
}
