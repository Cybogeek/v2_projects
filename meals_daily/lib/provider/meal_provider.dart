import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealNotifier extends StateNotifier<List<Meal>> {
  MealNotifier() : super(dummyMeals);
}

final mealProvider =
    StateNotifierProvider<MealNotifier, List<Meal>>((ref) => MealNotifier());
