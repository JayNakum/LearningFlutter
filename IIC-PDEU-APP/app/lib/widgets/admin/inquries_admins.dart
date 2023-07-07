import 'package:flutter/material.dart';

class InquriesScreen extends StatelessWidget {
  const InquriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 200,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, position) {
          return InquriesCard(
            position: position,
            startupname: 'Minerva',
            inquirytopic: 'Mess and Accomadation',
          );
        },
      ),
    );
  }
}

class InquriesCard extends StatelessWidget {
  final int position;
  final String inquirytopic;
  final String startupname;
  const InquriesCard(
      {Key? key,
      required this.position,
      required this.inquirytopic,
      required this.startupname})
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
              child: Column(
                children: [
                  Text(
                    inquirytopic,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    startupname,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.file_open),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check_box),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
