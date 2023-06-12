import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_daily/provider/favorite_meal_provider.dart';
import 'package:meals_daily/provider/filter_provider.dart';
import 'package:meals_daily/screens/categoryscreen.dart';
import 'package:meals_daily/screens/mealscreen.dart';

import '../widgets/custom_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedpageindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final meals = ref.watch(mealProvider);
    final favlist = ref.watch(favoriteMealProvider);
    // final activefilters = ref.watch(filterprovider);
    final availablemeal = ref.watch(filteredMealsProvider);
    print(favlist);
    Widget activePage = CategoryScreen(
      availablemeals: availablemeal,
    );
    var activePagetitle = 'Categories';
    if (_selectedpageindex == 1) {
      activePagetitle = 'Your Favorites';
      activePage = MealScreen(title: activePagetitle, meals: favlist);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePagetitle),
      ),
      drawer: const CustomDrawer(pageid: 1),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _selectpage(value),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Catergory'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
