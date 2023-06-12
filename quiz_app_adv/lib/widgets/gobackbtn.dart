import 'package:flutter/material.dart';

import '../quiz.dart';

class GoBackBtn extends StatelessWidget {
  const GoBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Quiz(),
          ),
        );
      },
      label: const Text('Go Back'),
      icon: const Icon(Icons.arrow_back),
    );
  }
}
