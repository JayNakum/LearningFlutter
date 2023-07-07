import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../helpers/api.dart';

class IPRServicesScreen extends StatefulWidget {
  const IPRServicesScreen({Key? key}) : super(key: key);

  @override
  State<IPRServicesScreen> createState() => _IPRServicesScreenState();
}

class _IPRServicesScreenState extends State<IPRServicesScreen> {
  final emailcontroller = TextEditingController();
  final proposedtitlecontroller = TextEditingController();
  final othercontroller = TextEditingController();
  String? iprtype;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IPR Service Form'),
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
                  child: Column(
                    children: [
                      Text(
                        'Type of IPR',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      DropdownButton<String>(
                        items: <String>[
                          'Patent',
                          'Trademark',
                          'Copyright',
                          'Design Application',
                          'PCT'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          iprtype = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: proposedtitlecontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Proposed Title',
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
              Card(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Please email the follwing files to the Nodal officer: \n1. IPR Document')),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    API
                        .iprServices(
                      username: API.currentUser,
                      email: emailcontroller.text,
                      other_remarks: othercontroller.text,
                      proposed_title: proposedtitlecontroller.text,
                      type_of_IPR: iprtype!,
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
