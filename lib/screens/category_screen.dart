import 'package:flutter/material.dart';

import 'package:navigation/data/dummy_data.dart';
import 'package:navigation/models/category.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/screens/meals_screen.dart';
import 'package:navigation/widgets/category_grid.dart';

class CategoryScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  const CategoryScreen({Key? key, required this.availableMeal})
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
    super.initState();
  }

  void onCategorySelect(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeal
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (var item in availableCategories)
            CategoryGrid(
              category: item,
              onTap: () {
                onCategorySelect(context, item);
              },
            )
        ],
      ),
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
          child: child,
        );
      },
    );
  }
}
