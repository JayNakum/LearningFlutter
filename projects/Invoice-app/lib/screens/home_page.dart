// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:project/screens/add_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int a = 0;
  List<ListWidget> itemList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice app'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              child: Center(
                child: Text(
                  'Invoices',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return itemList[index];
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
          height: 70,
          width: 200,
          child: FittedBox(
            child: ElevatedButton(
              child: Text('Add Invoice'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddItem(),
                  ),
                );
                ListWidget item = ListWidget(a);
                itemList.add(item);
                setState(() {});
              },
            ),
          )),
    );
  }
}

class ListWidget extends StatelessWidget {
  ListWidget(int index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Invoice',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Rs.100',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
