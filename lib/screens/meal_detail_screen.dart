import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onIconPressed;
  const MealDetailScreen({
    Key? key,
    required this.meal,
    required this.onIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                onIconPressed(meal);
              },
              icon: const Icon(Icons.star),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /*Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: Constants.borderRadiusMed),
          clipBehavior: Clip.hardEdge,
          elevation: 3,
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
          ),
                ),*/
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Ingredients',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Steps',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ...meal.steps.map(
                (step) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
