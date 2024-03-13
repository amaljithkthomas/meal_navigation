import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onScreenSelect;
  const MainDrawer({
    Key? key,
    required this.onScreenSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                theme.colorScheme.primaryContainer,
                theme.colorScheme.primaryContainer.withOpacity(.8)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Cooking Up',
                  style: theme.textTheme.titleLarge
                      ?.copyWith(color: theme.colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: theme.colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            onTap: () {
              onScreenSelect('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: theme.colorScheme.onBackground,
            ),
            title: Text(
              'Filter',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            onTap: () {
              onScreenSelect('filter');
            },
          )
        ],
      ),
    );
  }
}
