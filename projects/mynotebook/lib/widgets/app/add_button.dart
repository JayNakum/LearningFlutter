import 'package:flutter/material.dart';
import 'package:mynotebook/models/page.dart';

class AddButton extends StatelessWidget {
  final page what;
  const AddButton(this.what, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (what == page.book) {}
        if (what == page.chat) {}
        if (what == page.discussion) {}
      },
      child: const Icon(Icons.add_rounded),
    );
  }
}
