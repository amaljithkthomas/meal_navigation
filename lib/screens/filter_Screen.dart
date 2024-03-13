import 'package:flutter/material.dart';
import 'package:navigation/widgets/filter_switch.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian;
}

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> selectedFilter;
  const FilterScreen({
    Key? key,
    required this.selectedFilter,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    _isGlutenFree = widget.selectedFilter[Filter.glutenFree]!;
    _isLactoseFree = widget.selectedFilter[Filter.lactoseFree]!;
    _isVegetarian = widget.selectedFilter[Filter.vegetarian]!;
    _isVegan = widget.selectedFilter[Filter.vegan]!;
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
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFree,
            Filter.lactoseFree: _isLactoseFree,
            Filter.vegan: _isVegan,
            Filter.vegetarian: _isVegetarian,
          });
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
