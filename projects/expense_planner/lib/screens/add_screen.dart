// Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../models/add_screen_args.dart';
import '../models/expense.dart';
import '../providers/expenses.dart';
// Widgets
//Screens

class AddScreen extends StatefulWidget {
  static const routeName = '/add-expense-screen';

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _nameFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _newTransaction = Expense(
    id: null,
    amount: 0.0,
    name: '',
    dateTime: null,
  );
  var _initValues = {
    'amount': '',
    'name': '',
    'description': '',
    'date': DateTime.now(),
  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final AddScreenArgs args = ModalRoute.of(context).settings.arguments;

      if (args.id != null) {
        _newTransaction =
            Provider.of<Expenses>(context, listen: false).findById(args.id);
        _initValues = {
          'amount': _newTransaction.amount.toString(),
          'name': _newTransaction.name,
          'description': _newTransaction.description,
          'date': _newTransaction.dateTime,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_newTransaction.id == null) {
      Provider.of<Expenses>(context, listen: false).addExpense(_newTransaction);
    } else {
      Provider.of<Expenses>(context, listen: false)
          .editExpense(_newTransaction.id, _newTransaction);
    }
    Provider.of<Expenses>(context, listen: false).calculateTotal();
    Navigator.of(context).pop();
  }

  DateTime _selectedDate = DateTime.now();
  // void _presentDatePicker() {
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(_selectedDate.year - 10),
  //     lastDate: DateTime.now(),
  //   ).then((pickedDate) {
  //     if (pickedDate == null) {
  //       return;
  //     }
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final AddScreenArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.isAdd == 0
            ? 'Add an Expense'
            : args.isAdd == 1
                ? 'Add to Budget'
                : args.isAdd == 2
                    ? 'Edit Budget'
                    : args.isAdd == 3
                        ? 'Edit Expense'
                        : 'How the hell are you here!?'),
        actions: [
          IconButton(
            icon: Icon(Icons.save_rounded),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                initialValue: _initValues['amount'],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_nameFocusNode);
                },
                validator: (amt) {
                  if (amt.isEmpty) {
                    return 'Please Provide a value';
                  }
                  return null;
                },
                onSaved: (amt) {
                  _newTransaction = Expense(
                    id: _newTransaction.id,
                    amount: double.parse(amt),
                    name: _newTransaction.name,
                    dateTime: _newTransaction.dateTime,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                initialValue: _initValues['name'],
                textInputAction: TextInputAction.next,
                focusNode: _nameFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (name) {
                  if (name == null) {
                    return 'Please Provide a value';
                  }
                  return null;
                },
                onSaved: (name) {
                  _newTransaction = Expense(
                    id: _newTransaction.id,
                    amount: _newTransaction.amount,
                    name: name,
                    dateTime: _newTransaction.dateTime,
                  );
                },
              ),
              TextFormField(
                // TODO: Description not visible
                decoration: InputDecoration(labelText: 'Description'),
                initialValue: _initValues['description'],
                focusNode: _descriptionFocusNode,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (desc) {
                  _newTransaction = Expense(
                    id: _newTransaction.id,
                    amount: _newTransaction.amount,
                    name: _newTransaction.name,
                    description: desc,
                    dateTime: _newTransaction.dateTime,
                  );
                },
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text('Date and Time: '),
                    Expanded(
                      child: DateTimeField(
                        initialValue: _initValues['date'],
                        format: DateFormat('dd-MM-yyyy').add_Hm(),
                        onShowPicker: (ctx, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(_selectedDate.year - 10),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
                            );
                            setState(() {
                              _selectedDate = DateTimeField.combine(date, time);
                            });
                            return DateTimeField.combine(date, time);
                          }
                          return currentValue;
                        },
                        onSaved: (date) {
                          _newTransaction = Expense(
                            id: _newTransaction.id,
                            amount: _newTransaction.amount,
                            name: _newTransaction.name,
                            description: _newTransaction.description,
                            dateTime: date,
                          );
                        },
                      ),
                      // InputDatePickerFormField(
                      //   firstDate: DateTime(_selectedDate.year - 10),
                      //   lastDate: DateTime.now(),
                      //   initialDate: DateTime(_initValues['date']),
                      //   onDateSaved:
                      // (date) {
                      //     _newTransaction = Expense(
                      //       id: _newTransaction.id,
                      //       amount: _newTransaction.amount,
                      //       name: _newTransaction.name,
                      //       description: _newTransaction.description,
                      //       dateTime: date,
                      //     );
                      //   },
                      //   errorFormatText: 'Please enter date in mm/dd/yyyy',
                      //   errorInvalidText: 'Please enter date in mm/dd/yyyy',
                      //   fieldLabelText:
                      //       _selectedDate == null ? 'No Date Selected' : 'Date',
                      // ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.calendar_today_rounded),
                    //   onPressed: _presentDatePicker,
                    // ),
                    // TextButton(
                    //   child: Text('Select Date'),
                    //   onPressed: _presentDatePicker,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
