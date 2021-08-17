import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses with ChangeNotifier {
  List<Expense> _expenses = [
    Expense(
      id: 'e01',
      amount: 29.99,
      name: 'Test1',
      dateTime: DateTime.now(),
    ),
    Expense(
      id: 'e02',
      amount: 45.00,
      name: 'Test2',
      description: 'Testing testing 1..2..3..',
      dateTime: DateTime.now(),
    ),
    Expense(
      id: 'e03',
      amount: 100.00,
      name: 'Test3',
      categoryName: 'Hospital',
      description: 'Medicine',
      dateTime: DateTime.now(),
    ),
  ];
  double _totalExpenses = 0.0;

  List<Expense> get expenses {
    return [..._expenses];
  }

  double get totalExpenses {
    return _totalExpenses;
  }

  List<Expense> categorise(String categoryName) {
    List<Expense> _categorisedExpenses = [];
    _expenses.forEach((expense) {
      if (expense.categoryName == categoryName) {
        _categorisedExpenses.add(expense);
      }
    });
    return _categorisedExpenses;
  }

  double calculateCategoryTotal(String categoryName) {
    double _categoryTotal;
    final _categorisedExpenses = categorise(categoryName);
    _categorisedExpenses.forEach((categorisedExpense) {
      _categoryTotal += categorisedExpense.amount;
    });
    return _categoryTotal;
  }

  Expense findById(String id) {
    return _expenses.firstWhere((exp) => exp.id == id);
  }

  void addExpense(Expense expense) {
    final newExpense = Expense(
      id: expense.id,
      amount: expense.amount,
      name: expense.name,
      description: expense.description,
      dateTime: expense.dateTime,
    );
    _expenses.add(newExpense);
    notifyListeners();
  }

  void editExpense(String id, Expense newExpense) {
    final expenseIndex = _expenses.indexWhere((exp) => exp.id == id);
    if (expenseIndex >= 0) {
      _expenses[expenseIndex] = newExpense;
    } else {
      print('...');
    }
    notifyListeners();
  }

  void calculateTotal() {
    _totalExpenses = 0.0;
    _expenses.forEach((category) {
      _totalExpenses += category.amount;
    });
    // notifyListeners();
  }

  void deleteExpense(String id) {
    final existingExpIndex = _expenses.indexWhere((exp) => exp.id == id);
    // var existingExp = _expenses[existingExpIndex];
    _expenses.removeAt(existingExpIndex);
    // existingExp = null;
    notifyListeners();
  }
}
