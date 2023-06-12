import 'package:flutter/material.dart';
import 'package:meals_daily/screens/mealscreen.dart';
import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, this.availablemeals = dummyMeals});
  final List<Meal> availablemeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  void _selectcategory(context, Category category) {
    final filteredmeals = widget.availablemeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
        title: category.title.toString(),
        meals: filteredmeals,
      ),
    ));
  }

  late AnimationController _animation;
  @override
  void initState() {
    // TODO: implement initState
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0))
              .animate(
            CurvedAnimation(parent: _animation, curve: Curves.easeInOut),
          ),
          child: child,
        );
      },
      animation: _animation,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: availableCategories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return CategoryGridItem(
            category: availableCategories[index],
            onselect: () =>
                _selectcategory(context, availableCategories[index]),
          );
        },
      ),
    );
  }
}
