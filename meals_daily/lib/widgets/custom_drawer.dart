import 'package:flutter/material.dart';
import 'package:meals_daily/screens/filterscreen.dart';
import 'package:meals_daily/screens/tabscreen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.pageid});
  final int pageid;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.7),
                  Theme.of(context).colorScheme.primaryContainer
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          pageid == 1
              ? ListTile(
                  leading: const Icon(Icons.filter_list_outlined),
                  title: Text('Filter',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FilterScreen(),
                        ));
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.dining_outlined),
                  title: Text(
                    'Meals',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TabScreen(),
                        ));
                  },
                ),
        ],
      ),
    );
  }
}
