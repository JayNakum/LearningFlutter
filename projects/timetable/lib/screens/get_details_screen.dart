import 'package:flutter/material.dart';

class GetDetailsScreen extends StatelessWidget {
  const GetDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.deepPurple,
        padding: const EdgeInsets.all(70.0),
        child: Card(
          elevation: 10,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                child: Column(
                  children: <Widget>[
                    InputCards(width: width),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputCards extends StatelessWidget {
  const InputCards({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: width / 2.5,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Faculty Name',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
            ),
          ),
          SizedBox(
            width: width / 2.5,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Subject Name',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
