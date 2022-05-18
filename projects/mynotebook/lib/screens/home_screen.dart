import 'package:flutter/material.dart';
import 'package:mynotebook/models/page.dart';
import 'package:mynotebook/screens/book_page.dart';
import 'package:mynotebook/widgets/app/add_button.dart';
import 'package:mynotebook/widgets/app/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notebook"),
      ),
      body: const BookPage(),
      floatingActionButton: const AddButton(page.book),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
