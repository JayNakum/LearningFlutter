import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/home_screen.dart';
import './screens/settings_screen.dart';
import './screens/add_screen.dart';
import './screens/incomes_screen.dart';

import './providers/categories.dart';
import './providers/incomes.dart';
import './providers/expenses.dart';

class ExpensePlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Incomes(),
        ),
        ChangeNotifierProvider(
          create: (_) => Categories(),
        ),
        ChangeNotifierProvider(
          create: (_) => Expenses(),
        ),
      ],
      child: MaterialApp(
        title: 'Expense Planner',
        theme: ThemeData(
          accentColor: Colors.purple,
        ),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
          AddScreen.routeName: (ctx) => AddScreen(),
          IncomesScreen.routeName: (ctx) => IncomesScreen(),
        },
      ),
    );
  }
}
