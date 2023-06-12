import 'package:flutter/material.dart';

class NoShowData extends StatelessWidget {
  const NoShowData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: const Text(
              'Add Some Expenses to Show in the List.',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
