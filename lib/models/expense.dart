import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
//build a unique id dynamically whenever an expense object is created
//used uuid package
const uuid = Uuid();

enum Category { food, travel, leisure, work }
//enum predefined allowed values

const Map categoryIcons = {
  //Icon map
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_class,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

//defn of expense value item
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  //generated a unique id and assign it as an intial vlaue to the id proerty whenever the expense class is initialize
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category; //custom type
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList(); // addn constructor function
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
