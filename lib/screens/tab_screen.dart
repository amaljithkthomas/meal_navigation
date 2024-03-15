import 'package:flutter/material.dart';
import 'package:navigation/provider/fav_provider.dart';
import 'package:navigation/provider/filter_provider.dart';
import 'package:navigation/screens/category_screen.dart';
import 'package:navigation/screens/filter_Screen.dart';
import 'package:navigation/screens/meals_screen.dart';
import 'package:navigation/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// const kInitialFiler = {
//   Filter.glutenFree: false,
//   Filter.lactoseFree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedIndex = 0;
  //final List<Meal> favMeals = [];

  void onTabChanged(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  //
  // void onFavouritePressed(Meal meal) {
  //   final isExisting = favMeals.contains(meal);
  //   if (isExisting) {
  //     favMeals.remove(meal);
  //     showIndication('Favourite no longer available');
  //   } else {
  //     favMeals.add(meal);
  //     showIndication('Meal added to Favourite');
  //   }
  //   setState(() {});
  // }

  void onScreenSelect(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filter') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //final meals = ref.watch(mealProvider);
    final favMeals = ref.watch(favouriteProvider);
    //final activeFilter = ref.watch(filterProvider);
    final availableMeal = ref.watch(filteredProvider);

    //     meals.where((meal) {
    //   if (activeFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
    //     return false;
    //   }
    //   if (activeFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
    //     return false;
    //   }
    //   if (activeFilter[Filter.vegetarian]! && !meal.isVegetarian) {
    //     return false;
    //   }
    //   if (activeFilter[Filter.vegan]! && !meal.isVegan) {
    //     return false;
    //   }
    //   return true;
    // }).toList();
    //print(availableMeal);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? 'Categories' : 'Your Favourites'),
      ),
      drawer: MainDrawer(
        onScreenSelect: onScreenSelect,
      ),
      body: selectedIndex == 0
          ? CategoryScreen(
              availableMeal: availableMeal,
            )
          : MealsScreen(
              meals: favMeals,
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
