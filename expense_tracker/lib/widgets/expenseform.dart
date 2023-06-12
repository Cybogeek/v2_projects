import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.funct});
  final Function funct;
  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  TextEditingController tcontrol = TextEditingController();
  TextEditingController acontrol = TextEditingController();
  Category ccontrol = Category.leisure;
  DateTime selecteddate = DateTime.now();

  void getcat(Category cat) {
    setState(() {
      ccontrol = cat;
    });
  }

  @override
  void dispose() {
    tcontrol.dispose();
    acontrol.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var keyboardpos = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(
          left: 16, right: 16, top: 25, bottom: keyboardpos + 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Add New Expense',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            TextField(
              controller: tcontrol,
              maxLength: 25,
              decoration: const InputDecoration(
                  label: Text('Title'), hintText: 'Title'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: acontrol,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '\$ ',
                      label: Text('Amount'),
                      hintText: 'Amount',
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.yMd().format(selecteddate),
                      ),
                      IconButton(
                          onPressed: () async {
                            var now = DateTime.now();
                            var firstdate = DateTime(now.year - 1);
                            await showDatePicker(
                                    context: context,
                                    initialDate: now,
                                    firstDate: firstdate,
                                    lastDate: now)
                                .then((value) => setState(() {
                                      if (value != null) {
                                        selecteddate = value;
                                      }
                                    }));
                          },
                          icon: const Icon(Icons.calendar_month))
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: CustomDropdown(control: getcat, cat: ccontrol),
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (tcontrol.text.trim() == '' ||
                        acontrol.text == '' ||
                        double.tryParse(acontrol.text) == null ||
                        double.tryParse(acontrol.text)! <= 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiaryContainer,
                            title: Text(
                              'Error Message',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                              ),
                            ),
                            content: Text(
                              'Make Sure you enter correct Title, Amount, Catergory & Date.',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                    setState(() {
                      var data = Expense(
                          title: tcontrol.text,
                          amounnt: double.parse(acontrol.text),
                          date: selecteddate,
                          category: ccontrol);
                      widget.funct(data);
                      tcontrol.clear();
                      acontrol.clear();
                    });
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({super.key, required this.control, required this.cat});
  final Function control;
  final Category cat;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuEntry<dynamic>> getmenuitems() {
      List<DropdownMenuEntry<dynamic>> lt = [];
      for (var i in Category.values) {
        lt.add(
          DropdownMenuEntry(
            value: i,
            label: i.name.toUpperCase(),
            leadingIcon: Icon(
              categoryicon[i],
            ),
          ),
        );
      }
      return lt;
    }

    return DropdownButton(
      hint: const Text('Choose Category'),
      //hintText: 'Choose Category',
      value: cat,
      onChanged: (value) => control(value),
      items: Category.values
          .map((category) => DropdownMenuItem(
                value: category,
                child: Row(
                  children: [
                    Icon(categoryicon[category]),
                    Text(
                      category.name.toUpperCase(),
                    ),
                  ],
                ),
              ))
          .toList(), //getmenuitems(),
    );
  }
}
