import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/screens/meal_detail_screen.dart';
import 'package:navigation/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  const MealsScreen({
    Key? key,
    this.title,
    required this.meals,
  }) : super(key: key);

  void mealDetailPage(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: title == null
          ? null
          : AppBar(
              title: Text(title!),
            ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'oh... no... nothing here',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Try selecting a different category!..',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) => MealItem(
                  meal: meals[index],
                  navigateDetailPage: /*mealDetailPage,*/ (meal) {
                    mealDetailPage(context, meal);
                  }),
            ),
    );
  }
}
