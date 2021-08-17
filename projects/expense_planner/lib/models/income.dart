import 'package:flutter/material.dart';

class Income {
  final String id;
  final double amount;
  final String name;
  final String description;
  final DateTime dateTime;

  Income({
    @required this.id,
    @required this.amount,
    @required this.name,
    this.description = '',
    this.dateTime,
  });
}
