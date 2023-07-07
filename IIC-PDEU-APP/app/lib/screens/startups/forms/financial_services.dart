import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../helpers/api.dart';

class FinancialServicesScreen extends StatefulWidget {
  const FinancialServicesScreen({Key? key}) : super(key: key);

  @override
  State<FinancialServicesScreen> createState() =>
      _FinancialServicesScreenState();
}

class _FinancialServicesScreenState extends State<FinancialServicesScreen> {
  final emailcontroller = TextEditingController();
  final itemNamecontroller = TextEditingController();
  final itemValuecontroller = TextEditingController();
  final quantitycontroller = TextEditingController();
  final totalvaluecontroller = TextEditingController();
  final otherRemarkscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Services'),
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
                    controller: itemNamecontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Item Name',
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
                    controller: itemValuecontroller,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Item Value',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: quantitycontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Quantity',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: totalvaluecontroller,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 18, color: Colors.black),
                      labelText: 'Total Value',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: otherRemarkscontroller,
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
                        'Please email the follwing files to the Nodal officer: \n1. Bill \n2. Approval')),
              ),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    API
                        .financialServices(
                      username: API.currentUser,
                      email: emailcontroller.text,
                      item_name: itemNamecontroller.text,
                      item_value: itemValuecontroller.text,
                      other_remarks: otherRemarkscontroller.text,
                      quantity: quantitycontroller.text,
                      total_Value: totalvaluecontroller.text,
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
