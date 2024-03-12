import 'package:flutter/material.dart';

import 'package:navigation/data/dummy_data.dart';
import 'package:navigation/models/category.dart';
import 'package:navigation/screens/meals_screen.dart';
import 'package:navigation/widgets/category_grid.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  void onCategorySelect(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
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
    return GridView(
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
    );
  }
}
