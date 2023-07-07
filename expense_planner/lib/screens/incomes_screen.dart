import 'package:expense_planner/models/add_screen_args.dart';
import 'package:flutter/material.dart';

import '../widgets/budget_and_total.dart';
import '../widgets/incomes_budget_list.dart';

import 'add_screen.dart';

class IncomesScreen extends StatelessWidget {
  final isAdd = 1;
  static const routeName = '/incomes-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Incomes')),
      body: Column(
        children: <Widget>[
          BudgetAndTotal(
            onlyBudget: true,
          ),
          IncomesBudgetList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(
            AddScreen.routeName,
            arguments: AddScreenArgs(null, isAdd),
          );
        },
      ),
    );
  }
}
