// Packages
import 'package:flutter/material.dart';

import '../models/add_screen_args.dart';

// Widgets
import '../widgets/home_categories.dart';
import '../widgets/home_compare.dart';
import '../widgets/home_expenses.dart';
import '../widgets/app_drawer.dart';
import '../widgets/budget_and_total.dart';
// Screens
import 'add_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final isAdd = 0;
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeCategories(),
        'title': 'Categories',
      },
      {
        'page': HomeCompare(),
        'title': 'Compare',
      },
      {
        'page': HomeExpenses(null),
        'title': 'Expenses',
      },
    ];

    super.initState();
  }

  Object setBody() {
    return _pages[_selectedIndex]['page'];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Today'),
                      // value: ,
                    ),
                    PopupMenuItem(
                      child: Text('This Month'),
                      // value: ,
                    ),
                    PopupMenuItem(
                      child: Text('All'),
                      // value: ,
                    ),
                  ]),
        ],
      ),
      drawer: AppDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BudgetAndTotal(),
              setBody(),
            ],
          ),
        ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Compare',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grading_rounded),
            label: 'Expenses',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
