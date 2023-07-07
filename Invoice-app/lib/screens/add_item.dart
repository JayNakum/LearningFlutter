// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int total = 0;
  List<CustomWidget> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                'Add Item',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  total += 50;
                  CustomWidget obj = CustomWidget();
                  list.add(obj);
                  setState(() {});
                }),
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return list[index];
                },
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'Grand Total : $total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.done),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // int calculate(TextEditingController a) {
    //   var b = a.text;
    //   var c = int.parse(b);
    //   var res = 10 * c;
    //   return res;
    // }

    // TextEditingController count = TextEditingController();
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          height: 50,
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Item A',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    'Rs. 10/Item',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Count: 5',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    'Rs. 50',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     SizedBox(
              //       width: 20,
              //     ),
              //     Expanded(
              //       child: TextField(
              //         controller: count,
              //         style: TextStyle(fontSize: 20),
              //         decoration: InputDecoration(hintText: 'Enter item count'),
              //       ),
              //     ),
              //     SizedBox(
              //       width: 50,
              //     ),
              //     Text(
              //       (calculate(count)).toString(),
              //       style: TextStyle(fontSize: 20),
              //     ),
              //     SizedBox(
              //       width: 80,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
