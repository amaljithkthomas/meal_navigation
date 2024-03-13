import 'package:flutter/material.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/screens/category_screen.dart';
import 'package:navigation/screens/meals_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  final List<Meal> favMeals = [];
  void onTabChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void showIndication(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void onFavouritePressed(Meal meal) {
    final isExisting = favMeals.contains(meal);
    if (isExisting) {
      favMeals.remove(meal);
      showIndication('Favourite no longer available');
    } else {
      favMeals.add(meal);
      showIndication('Meal added to Favourite');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? 'Categories' : 'Your Favourites'),
      ),
      body: selectedIndex == 0
          ? CategoryScreen(
              onFavPressed: onFavouritePressed,
            )
          : MealsScreen(
              meals: favMeals,
              onFavouritePressed: onFavouritePressed,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onTabChanged,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
        ],
      ),
    );
  }
}
