import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            const Spacer(),
            IconButton(
              tooltip: 'My Notebook',
              onPressed: () {},
              icon: const Icon(Icons.book_rounded),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'DM',
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_outlined),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Discussions',
              onPressed: () {},
              icon: const Icon(Icons.format_align_left_rounded),
            ),
            const Spacer(),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
