import 'package:flutter/material.dart';
import 'package:navigation/constants/constants.dart';
import 'package:navigation/models/category.dart';

class CategoryGrid extends StatelessWidget {
  final Category category;
  final void Function() onTap;
  const CategoryGrid({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      splashColor: theme.colorScheme.primaryContainer,
      borderRadius: Constants.borderRadiusLarge,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.55),
              category.color.withOpacity(.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: Constants.borderRadiusLarge,
        ),
        child: Text(
          category.title,
          style: theme.textTheme.titleLarge
              ?.copyWith(color: theme.colorScheme.onBackground),
        ),
      ),
    );
  }
}
