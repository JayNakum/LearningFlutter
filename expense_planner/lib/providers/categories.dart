import 'package:flutter/material.dart';

import '../models/category.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [
    Category(
      name: 'Others',
      description: 'All the Uncategorised items',
      totalAmount: 100,
    ),
    Category(
      name: 'Hospital',
      description: 'My Hospital expenses',
      totalAmount: 100000,
    ),
  ];

  List<Category> get categories {
    return [..._categories];
  }

  Category findByName(String name) {
    return _categories.firstWhere((category) => name == category.name);
  }

  void deleteCategory(String name) {
    final existingCategory = _categories.indexWhere((cat) => cat.name == name);
    _categories.remove(existingCategory);
    notifyListeners();
  }
}
