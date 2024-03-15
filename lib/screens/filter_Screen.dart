import 'package:flutter/material.dart';
import 'package:navigation/provider/filter_provider.dart';
import 'package:navigation/widgets/filter_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    final currentFilter = ref.read(filterProvider);
    _isGlutenFree = currentFilter[Filter.glutenFree]!;
    _isLactoseFree = currentFilter[Filter.lactoseFree]!;
    _isVegetarian = currentFilter[Filter.vegetarian]!;
    _isVegan = currentFilter[Filter.vegan]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: PopScope(
        canPop: true,
        onPopInvoked: (bool didPop) {
          //if (didPop) return;
          ref.read(filterProvider.notifier).setFilters({
            Filter.glutenFree: _isGlutenFree,
            Filter.lactoseFree: _isLactoseFree,
            Filter.vegan: _isVegan,
            Filter.vegetarian: _isVegetarian,
          });

          // Navigator.of(context).pop({
          //   Filter.glutenFree: _isGlutenFree,
          //   Filter.lactoseFree: _isLactoseFree,
          //   Filter.vegan: _isVegan,
          //   Filter.vegetarian: _isVegetarian,
          // });
        },
        child: Column(
          children: [
            FilterSwitch(
              title: 'Gluten-Free ',
              subtitle: 'only include gluten-free meal',
              onTap: (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              },
              filterValue: _isGlutenFree,
            ),
            FilterSwitch(
              title: 'Lactose-Free',
              subtitle: 'only include lactose-free meal',
              onTap: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
              filterValue: _isLactoseFree,
            ),
            FilterSwitch(
              title: 'Vegan',
              subtitle: 'only include vegan meal',
              onTap: (value) {
                setState(() {
                  _isVegan = value;
                });
              },
              filterValue: _isVegan,
            ),
            FilterSwitch(
              title: 'Vegetarian',
              subtitle: 'only include vegetarian meal',
              onTap: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
              filterValue: _isVegetarian,
            )
          ],
        ),
      ),
    );
  }
}
