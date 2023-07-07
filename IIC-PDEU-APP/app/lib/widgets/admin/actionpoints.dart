import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user.dart';

class ActionpointsScreen extends StatelessWidget {
  final String feedback;
  const ActionpointsScreen(this.feedback, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Points List'),
      ),
      body: Actionspointscard(
        position: 1,
        actionpoint: feedback,
      ),
    );
  }
}

class Actionspointscard extends StatelessWidget {
  final int position;
  final String actionpoint;
  const Actionspointscard(
      {Key? key, required this.position, required this.actionpoint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Text(
              position.toString(),
              style: TextStyle(fontSize: 22.0),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.48,
              child: Text(
                actionpoint,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check_box),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cancel),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
