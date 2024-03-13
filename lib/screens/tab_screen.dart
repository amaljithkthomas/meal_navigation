import 'package:flutter/material.dart';
import 'package:navigation/data/dummy_data.dart';
import 'package:navigation/models/meal.dart';
import 'package:navigation/screens/category_screen.dart';
import 'package:navigation/screens/filter_Screen.dart';
import 'package:navigation/screens/meals_screen.dart';
import 'package:navigation/widgets/main_drawer.dart';

const kInitialFiler = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  final List<Meal> favMeals = [];
  Map<Filter, bool> selectedFilter = kInitialFiler;
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

  void onScreenSelect(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filter') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FilterScreen(
            selectedFilter: selectedFilter,
          ),
        ),
      );
      setState(() {
        selectedFilter = result ?? kInitialFiler;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = dummyMeals.where((meal) {
      if (selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? 'Categories' : 'Your Favourites'),
      ),
      drawer: MainDrawer(
        onScreenSelect: onScreenSelect,
      ),
      body: selectedIndex == 0
          ? CategoryScreen(
              onFavPressed: onFavouritePressed,
              availableMeal: availableMeal,
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
