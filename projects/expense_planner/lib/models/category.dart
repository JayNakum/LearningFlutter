import 'package:flutter/cupertino.dart';

class Category {
  final String name;
  double totalAmount;
  final String description;

  Category({
    @required this.name,
    this.totalAmount,
    this.description = '',
  });
}
