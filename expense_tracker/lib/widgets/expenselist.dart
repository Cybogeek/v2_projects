import 'package:flutter/material.dart';

import '../models/expense_model.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.regexpenses, required this.funct});

  final List<Expense> regexpenses;
  final Function funct;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        restorationId: 'lv',
        physics: const BouncingScrollPhysics(),
        itemCount: regexpenses.length,
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: Theme.of(context).colorScheme.errorContainer,
              child: Icon(
                Icons.delete_outlined,
                size: 32,
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
            key: ValueKey(regexpenses[index]),
            onDismissed: (direction) => funct(regexpenses[index]),
            child: SingleListTile(
              funct,
              regexpenses: regexpenses[index],
            ),
          );
        },
      ),
    );
  }
}

class SingleListTile extends StatelessWidget {
  const SingleListTile(
    this.funct, {
    super.key,
    required this.regexpenses,
  });

  final Expense regexpenses;
  final Function funct;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(regexpenses.title),
          leading: CircleAvatar(
            radius: 32,
            child: FittedBox(
              child: Text(
                '\$${regexpenses.amounnt.toStringAsFixed(2)}',
              ),
            ),
          ),
          trailing: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(categoryicon[regexpenses.category]),
                const SizedBox(
                  width: 4,
                ),
                Text(regexpenses.formatedDate),
              ],
            ),
          ),
          onTap: () {
            print(regexpenses.id);
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  title: const Text('Delete This Record!'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '${regexpenses.title.trim().toUpperCase()} costs \$${regexpenses.amounnt} on ${regexpenses.formatedDate}'),
                      const Text(
                          '\nOnce Deleted the data cannot be restored.\nAre You Sure?'),
                    ],
                  ),
                  actions: [
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancle'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        funct(regexpenses);
                        Navigator.pop(context);
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
