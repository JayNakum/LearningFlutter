import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../helpers/api.dart';

class LabServicesScreen extends StatefulWidget {
  const LabServicesScreen({Key? key}) : super(key: key);

  @override
  State<LabServicesScreen> createState() => _LabServicesScreenState();
}

class _LabServicesScreenState extends State<LabServicesScreen> {
  final emailcontroller = TextEditingController();
  final namelaboratorycontroller = TextEditingController();
  final equipmentcontroller = TextEditingController();
  final rawmaterialcontroller = TextEditingController();
  final testcontroller = TextEditingController();
  final durationcontroller = TextEditingController();
  final namescontroller = TextEditingController();
  final numbercontroller = TextEditingController();
  final othercontroller = TextEditingController();
  final reasoncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Services'),
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
                    controller: namelaboratorycontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Name of Laboratory',
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
                    controller: equipmentcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Equipment Required',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: rawmaterialcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Raw Material Required',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: testcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Test to be performed',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: durationcontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Duration',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: numbercontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Number of People',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namescontroller,
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
                    controller: othercontroller,
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
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    API
                        .labServices(
                      username: API.currentUser,
                      email: emailcontroller.text,
                      duration: durationcontroller.text,
                      name_of_laboratory: namelaboratorycontroller.text,
                      equipment_required: equipmentcontroller.text,
                      names_of_people: namescontroller.text,
                      number_of_people: numbercontroller.text,
                      other_remarks: othercontroller.text,
                      raw_materials_required: rawmaterialcontroller.text,
                      test: testcontroller.text,
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
