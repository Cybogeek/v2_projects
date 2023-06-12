import 'package:flutter/material.dart';

class MealItemMeta extends StatelessWidget {
  const MealItemMeta({super.key, required this.icondata, required this.label});
  final IconData icondata;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icondata,
          size: 27,
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.white),
        )
      ],
    );
  }
}
