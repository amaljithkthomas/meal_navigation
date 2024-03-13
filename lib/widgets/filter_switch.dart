import 'package:flutter/material.dart';

class FilterSwitch extends StatelessWidget {
  final bool filterValue;
  final void Function(bool isChanged) onTap;
  final String title;
  final String subtitle;
  const FilterSwitch({
    Key? key,
    required this.onTap,
    required this.filterValue,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SwitchListTile(
      value: filterValue,
      onChanged: onTap,
      title: Text(
        title,
        style: theme.textTheme.titleLarge?.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.labelMedium?.copyWith(
          color: theme.colorScheme.onBackground,
        ),
      ),
    );
  }
}
