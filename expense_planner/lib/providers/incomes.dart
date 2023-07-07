import 'package:flutter/material.dart';

import '../models/income.dart';

class Incomes with ChangeNotifier {
  List<Income> _incomes = [
    Income(
      id: 'i01',
      amount: 1000,
      name: 'Test1',
      description: 'Testing Testing',
      dateTime: DateTime.now(),
    ),
    Income(
      id: 'i02',
      amount: 100,
      name: 'Test2',
      description: 'Testing Testing 1..2..3..',
      dateTime: DateTime.now(),
    ),
  ];
  double _budget = 0.0;

  List<Income> get incomes {
    return [..._incomes];
  }

  double get budget {
    return _budget;
  }

  void calculateBudget() {
    _budget = 0.0;
    _incomes.forEach((income) {
      _budget = income.amount + _budget;
    });
    // notifyListeners();
  }
  //TODO: Add and edit budget

  void deleteIncome(String id) {
    final existingIncIndex = _incomes.indexWhere((inc) => inc.id == id);
    _incomes.removeAt(existingIncIndex);
    notifyListeners();
  }
}
