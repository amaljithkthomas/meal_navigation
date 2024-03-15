import 'package:flutter/material.dart';
import 'package:navigation/provider/filter_provider.dart';
import 'package:navigation/widgets/filter_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onScreenSelect: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == 'meals') {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          FilterSwitch(
            title: 'Gluten-Free ',
            subtitle: 'only include gluten-free meal',
            onTap: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
            filterValue: activeFilter[Filter.glutenFree]!,
          ),
          FilterSwitch(
            title: 'Lactose-Free',
            subtitle: 'only include lactose-free meal',
            onTap: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            filterValue: activeFilter[Filter.lactoseFree]!,
          ),
          FilterSwitch(
            title: 'Vegan',
            subtitle: 'only include vegan meal',
            onTap: (value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
            },
            filterValue: activeFilter[Filter.vegan]!,
          ),
          FilterSwitch(
            title: 'Vegetarian',
            subtitle: 'only include vegetarian meal',
            onTap: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
            filterValue: activeFilter[Filter.vegetarian]!,
          )
        ],
      ),
    );
  }
}
