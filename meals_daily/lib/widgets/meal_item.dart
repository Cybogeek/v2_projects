import 'package:flutter/material.dart';
import 'package:meals_daily/widgets/meal_item_meta.dart';

import '../models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onselect});
  final Meal meal;
  final Function(BuildContext ctx, Meal meal) onselect;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselect(context, meal);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl,
                ),
                height: MediaQuery.of(context).size.height * 0.25,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 32,
                  ),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemMeta(
                              icondata: Icons.schedule,
                              label: '${meal.duration} min'),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemMeta(
                            icondata: Icons.work_outline_rounded,
                            label: meal.complexity.name.replaceFirst(
                              RegExp(meal.complexity.name[0]),
                              meal.complexity.name[0].toUpperCase(),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          MealItemMeta(
                            icondata: Icons.currency_rupee_outlined,
                            label: meal.affordability.name.replaceFirst(
                              RegExp(meal.affordability.name[0]),
                              meal.affordability.name[0].toUpperCase(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
