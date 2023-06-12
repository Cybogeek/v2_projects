import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenseform.dart';
import 'package:flutter/material.dart';

import 'models/expense_model.dart';
import 'widgets/expenselist.dart';
import 'widgets/noshowdata.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _regexpenses = [
    Expense(
        title: 'Books',
        amounnt: 24.5,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Tools',
        amounnt: 45.5,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Files',
        amounnt: 10.5,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        title: 'Cake',
        amounnt: 39.5,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'ball',
        amounnt: 15.99,
        date: DateTime.now(),
        category: Category.leisure),
  ];
  void addexpense(Expense data) {
    setState(() {
      _regexpenses.add(data);
    });
  }

  void deletexpense(Expense id) {
    int itemIndex = _regexpenses.indexOf(id);
    setState(() {
      _regexpenses.remove(id);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 3),
          content: const Text('Expense Deleted Successfully!'),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: () => setState(() {
                    _regexpenses.insert(itemIndex, id);
                  }))),
    );
  }

  void showmodal() {
    showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      isScrollControlled: true,
      context: context,
      builder: (context) => ExpenseForm(funct: addexpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // print(width);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: showmodal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SizedBox(
          //height: constraints.maxHeight,
          child: width <= 600
              ? Column(
                  children: [
                    Chart(expenses: _regexpenses),
                    _regexpenses.isNotEmpty
                        ? Expanded(
                            child: ExpenseList(
                                regexpenses: _regexpenses, funct: deletexpense),
                          )
                        : const Expanded(
                            child: NoShowData(),
                          ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: Chart(expenses: _regexpenses)),
                    _regexpenses.isNotEmpty
                        ? Expanded(
                            child: ExpenseList(
                                regexpenses: _regexpenses, funct: deletexpense),
                          )
                        : const Expanded(child: NoShowData()),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showmodal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
