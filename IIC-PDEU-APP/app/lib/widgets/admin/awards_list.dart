import 'package:flutter/material.dart';

class AwardsList extends StatelessWidget {
  const AwardsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List awards = [];
    return ListView.builder(
      itemCount: awards.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(awards[index]['name']),
            subtitle: Text(awards[index]['description']),
            trailing: Text(awards[index]['date']),
          ),
        );
      },
    );
  }
}
