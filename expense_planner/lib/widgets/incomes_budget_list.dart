import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/incomes.dart';

import '../models/add_screen_args.dart';
import '../screens/add_screen.dart';

class IncomesBudgetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final incomes = Provider.of<Incomes>(context).incomes;
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: incomes.length,
        itemBuilder: (ctx, i) => IncomesBudget(
          id: incomes[i].id,
          amount: incomes[i].amount,
          name: incomes[i].name,
          description: incomes[i].description,
          dateTime: incomes[i].dateTime,
        ),
      ),
    );
  }
}

class IncomesBudget extends StatefulWidget {
  final String id;
  final double amount;
  final String name;
  final String description;
  final DateTime dateTime;

  IncomesBudget({
    @required this.id,
    @required this.amount,
    @required this.name,
    @required this.description,
    @required this.dateTime,
  });

  @override
  _IncomesBudgetState createState() => _IncomesBudgetState();
}

class _IncomesBudgetState extends State<IncomesBudget> {
  final isAdd = 2;
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
        Provider.of<Incomes>(context, listen: false).deleteIncome(widget.id);
      },
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(4.0),
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
            radius: 25,
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
      ),
    );
  }
}
