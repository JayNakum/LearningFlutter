import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:auto_size_text/auto_size_text.dart';

import '../providers/categories.dart';

import './home_expenses.dart';

class HomeCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context).categories;
    return Container(
      height: MediaQuery.of(context).size.height * 0.71,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (ctx, i) => HomeCategory(
          amount: categories[i].totalAmount,
          name: categories[i].name,
          description: categories[i].description,
        ),
      ),
    );
  }
}

class HomeCategory extends StatefulWidget {
  final double amount;
  final String name;
  final String description;

  HomeCategory({
    @required this.amount,
    @required this.name,
    @required this.description,
  });

  @override
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.name),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.all(2),
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
        Provider.of<Categories>(context, listen: false)
            .deleteCategory(widget.name);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.all(4.0),
              title: Text(widget.name),
              subtitle: Text(widget.description),
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                foregroundColor: Colors.white,
                radius: 25,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  // child: AutoSizeText(widget.amount.toString()),
                  child: FittedBox(
                    child: Text(
                      widget.amount.toString(),
                      softWrap: false,
                    ),
                  ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded) HomeExpenses(widget.name),
          ],
        ),
      ),
    );
  }
}
