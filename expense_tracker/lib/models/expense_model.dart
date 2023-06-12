import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();
var formater = DateFormat.yMd();

enum Category { food, travel, leisure, work, savings }

const categoryicon = {
  Category.savings: Icons.currency_rupee_outlined,
  Category.food: Icons.lunch_dining_outlined,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work: Icons.work_history_outlined,
  Category.travel: Icons.map_outlined
};

class Expense {
  Expense(
      {required this.title,
      required this.amounnt,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amounnt;
  final DateTime date;
  final Category category;

  String get formatedDate {
    return formater.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.expenses, required this.category});

  ExpenseBucket.forCategory(List<Expense> allexpenses, this.category)
      : expenses = allexpenses
            .where((element) => element.category == category)
            .toList();

  final List<Expense> expenses;
  final Category category;

  double get totalexpense {
    double sum = 0;
    for (var i in expenses) {
      sum += i.amounnt;
    }
    return sum;
  }
}
