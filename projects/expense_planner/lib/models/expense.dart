import 'package:flutter/material.dart';

class Expense {
  final String id;
  final double amount;
  final String name;
  final String description;
  final String categoryName;
  final DateTime dateTime;

  Expense({
    @required this.id,
    @required this.amount,
    @required this.name,
    this.description = '',
    this.categoryName = 'Others',
    @required this.dateTime,
  });
}
