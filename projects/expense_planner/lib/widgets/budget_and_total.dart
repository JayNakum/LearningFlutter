import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/incomes.dart';
import '../providers/expenses.dart';

import '../screens/incomes_screen.dart';

class BudgetAndTotal extends StatefulWidget {
  final bool onlyBudget;
  BudgetAndTotal({this.onlyBudget = false});
  @override
  _BudgetAndTotalState createState() => _BudgetAndTotalState();
}

class _BudgetAndTotalState extends State<BudgetAndTotal> {
  // var _isInit = true;
  void _editBudget() {
    Navigator.of(context).pushNamed(IncomesScreen.routeName);
  }

  @override
  void initState() {
    Provider.of<Expenses>(context, listen: false).calculateTotal();
    Provider.of<Incomes>(context, listen: false).calculateBudget();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     // Future.delayed(Duration.zero,
  //     // () =>
  //     Provider.of<Expenses>(context, listen: false).calculateTotal();
  //     Provider.of<Incomes>(context, listen: false).calculateBudget();
  //     // );
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final double _budget = Provider.of<Incomes>(context, listen: false).budget;
    final double _totalExpense =
        Provider.of<Expenses>(context, listen: false).totalExpenses;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: ListTile(
            title: Text(
              _budget.toString(),
              softWrap: false,
              style: TextStyle(
                color:
                    _budget > 0.0 ? Colors.green : Theme.of(context).errorColor,
              ),
            ),
            subtitle: Text('Budget'),
            trailing: widget.onlyBudget
                ? null
                : IconButton(
                    icon: Icon(Icons.edit_rounded),
                    onPressed: _editBudget,
                  ),
          ),
        ),
        if (!widget.onlyBudget)
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ListTile(
              title: Text(
                _totalExpense.toString(),
                softWrap: false,
                style: TextStyle(
                  color: _totalExpense < _budget
                      ? Colors.green
                      : Theme.of(context).errorColor,
                ),
              ),
              subtitle: Text('Total Expenses'),
            ),
          ),
      ],
    );
  }
}
