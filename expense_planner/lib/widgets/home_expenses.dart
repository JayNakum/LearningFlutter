import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// import 'package:auto_size_text/auto_size_text.dart';

import '../models/add_screen_args.dart';

import '../screens/add_screen.dart';

import '../providers/expenses.dart';

class HomeExpenses extends StatelessWidget {
  // final _index = 1;
  final String categoryName;
  HomeExpenses(this.categoryName);

  @override
  Widget build(BuildContext context) {
    final providerExp = Provider.of<Expenses>(context);
    final expenses = categoryName == null
        ? providerExp.expenses
        : providerExp.categorise(categoryName);
    return Container(
      height: expenses.length.toDouble() * 85,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: expenses.length,
        itemBuilder: (ctx, i) => HomeExpense(
          id: expenses[i].id,
          amount: expenses[i].amount,
          name: expenses[i].name,
          description: expenses[i].description,
          dateTime: expenses[i].dateTime,
        ),
      ),
    );
  }
}

class HomeExpense extends StatefulWidget {
  final String id;
  final double amount;
  final String name;
  final String description;
  final DateTime dateTime;

  HomeExpense({
    @required this.id,
    @required this.amount,
    @required this.name,
    @required this.description,
    @required this.dateTime,
  });

  @override
  _HomeExpenseState createState() => _HomeExpenseState();
}

class _HomeExpenseState extends State<HomeExpense> {
  final isAdd = 3;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      onDismissed: (_) {
        Provider.of<Expenses>(context, listen: false).deleteExpense(widget.id);
      },
      child: ListTile(
        // contentPadding: const EdgeInsets.all(4.0),
        title: Text(widget.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DateFormat.yMMMd().add_Hm().format(widget.dateTime)),
            Text(widget.description),
          ],
        ),
        leading: CircleAvatar(
          // child: AutoSizeText(widget.amount.toString()),
          // radius: 30,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget.amount.toString(),
                softWrap: false,
              ),
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.edit_rounded),
          onPressed: () {
            Navigator.of(context).pushNamed(
              AddScreen.routeName,
              arguments: AddScreenArgs(widget.id, isAdd),
            );
          },
        ),
      ),
    );
  }
}
