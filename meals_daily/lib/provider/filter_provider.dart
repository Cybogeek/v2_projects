import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'meal_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

final filterprovider =
    StateNotifierProvider<FilterNotifier, Map<Filters, bool>>(
        (ref) => FilterNotifier());

class FilterNotifier extends StateNotifier<Map<Filters, bool>> {
  FilterNotifier()
      : super({
          Filters.glutenFree: false,
          Filters.lactoseFree: false,
          Filters.vegetarian: false,
          Filters.vegan: false
        });
  setFilters(Filters filters, bool value) {
    state = {...state, filters: value};
  }
}

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activefilters = ref.watch(filterprovider);
  return meals.where((meal) {
    if (activefilters[Filters.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filters.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filters.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
