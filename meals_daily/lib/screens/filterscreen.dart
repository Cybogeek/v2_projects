import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_daily/widgets/custom_drawer.dart';
import '../provider/filter_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<Filters, bool> filtersmap = ref.watch(filterprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const CustomDrawer(pageid: 2),
      body: Column(
        children: [
          SwitchListTile(
            value: filtersmap[Filters.glutenFree]!,
            onChanged: (value) => ref
                .read(filterprovider.notifier)
                .setFilters(Filters.glutenFree, value),
            title: Text(
              Filters.glutenFree.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include gluten Free Items',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filtersmap[Filters.lactoseFree]!,
            onChanged: (value) => ref
                .read(filterprovider.notifier)
                .setFilters(Filters.lactoseFree, value),
            title: Text(
              Filters.lactoseFree.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include Lactose Free Items',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filtersmap[Filters.vegetarian]!,
            onChanged: (value) => ref
                .read(filterprovider.notifier)
                .setFilters(Filters.vegetarian, value),
            title: Text(
              Filters.vegetarian.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include Vegetarian Items',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: filtersmap[Filters.vegan]!,
            onChanged: (value) => ref
                .read(filterprovider.notifier)
                .setFilters(Filters.vegan, value),
            title: Text(
              Filters.vegan.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            subtitle: Text(
              'Only Include Vegan Items',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
