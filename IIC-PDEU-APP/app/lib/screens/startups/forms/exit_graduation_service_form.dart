import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iic_pdeu/helpers/api.dart';

class ExitAndGraduationScreen extends StatefulWidget {
  const ExitAndGraduationScreen({Key? key}) : super(key: key);

  @override
  State<ExitAndGraduationScreen> createState() =>
      _ExitAndGraduationScreenState();
}

class _ExitAndGraduationScreenState extends State<ExitAndGraduationScreen> {
  final emailcontroller = TextEditingController();
  final extensioncontroller = TextEditingController();
  final reasoncontroller = TextEditingController();
  final progresscontroller = TextEditingController();
  final othercontroller = TextEditingController();

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
                    controller: extensioncontroller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Extension Time (in months)',
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
                    controller: reasoncontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Reason for Extension',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: progresscontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Progress Update',
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
                        .exitAndGraduation(
                      username: API.currentUser,
                      email: emailcontroller.text,
                      extension_time: extensioncontroller.text,
                      other_remarks: othercontroller.text,
                      progress_update: progresscontroller.text,
                      reason_for_extension: reasoncontroller.text,
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
