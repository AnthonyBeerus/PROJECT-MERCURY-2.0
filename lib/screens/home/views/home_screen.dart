import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercury_2/screens/add_expense/views/add_expense.dart';
import 'package:mercury_2/screens/home/views/main_screen.dart';
import 'package:mercury_2/screens/stats/stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Theme.of(context).colorScheme.primary;
  late Color unselectedItem = Theme.of(context).colorScheme.onBackground;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.money_dollar,
              color: index == 0
                  ? selectedItem
                  : Theme.of(context).colorScheme.onBackground,
            ),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.creditcard,
              color: index == 1
                  ? selectedItem
                  : Theme.of(context).colorScheme.onBackground,
            ),
            label: 'Transactions',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const AddExpense()
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(CupertinoIcons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: index == 0 ? const MainScreen() : const StatsScreen(),
    );
  }
}
