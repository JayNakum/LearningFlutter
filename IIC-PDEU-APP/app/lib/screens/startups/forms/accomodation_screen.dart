import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iic_pdeu/helpers/api.dart';

class AccomodationAndMessScreen extends StatefulWidget {
  const AccomodationAndMessScreen({Key? key}) : super(key: key);

  @override
  State<AccomodationAndMessScreen> createState() =>
      _AccomodationAndMessScreenState();
}

class _AccomodationAndMessScreenState extends State<AccomodationAndMessScreen> {
  final emailcontroller = TextEditingController();
  final durationAcontroller = TextEditingController();
  final numberAcontroller = TextEditingController();
  final namesAcontroller = TextEditingController();
  final otherAcontroller = TextEditingController();
  final durationMcontroller = TextEditingController();
  final numberMcontroller = TextEditingController();
  final namesMcontroller = TextEditingController();
  final otherMcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accomodation and Mess'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fill up the form below',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: durationAcontroller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText:
                          'Expected Duration of Accommodation (In Months)',
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: numberAcontroller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Number of people',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namesAcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Names of people',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: otherAcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Other Remarks',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: durationMcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText:
                          'Expected Duration for Mess facilities (In Months)',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: numberMcontroller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Number of people',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namesMcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Names of people',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: otherMcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Other Remarks for Mess',
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    API
                        .messAndAccomodation(
                      username: API.currentUser,
                      email: emailcontroller.text,
                      durationA: durationAcontroller.text,
                      numberOfPeopleA: numberAcontroller.text,
                      namesA: namesAcontroller.text,
                      remarksA: otherAcontroller.text,
                      durationM: durationMcontroller.text,
                      numberOfPeopleM: numberMcontroller.text,
                      namesM: namesMcontroller.text,
                      remarksM: otherMcontroller.text,
                    )
                        .then((_) {
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
