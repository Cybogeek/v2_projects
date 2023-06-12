import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealProvider, List<Meal>>(
        (ref) => FavoriteMealProvider());

class FavoriteMealProvider extends StateNotifier<List<Meal>> {
  FavoriteMealProvider() : super([]);
  bool toggleFavoriteMealStatus(Meal meal) {
    bool isFav = state.contains(meal);
    if (isFav) {
      state = state.where((element) => element.id != meal.id).toList();
      return !isFav;
    } else {
      state = [...state, meal];
      return !isFav;
    }
  }

  bool isChecked(Meal meal) {
    return state.contains(meal);
  }
}
