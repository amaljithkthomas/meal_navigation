enum Complexity {
  simple,
  challenging,
  hard;

  String get getWord {
    switch (this) {
      case Complexity.simple:
        return Complexity.simple.name[0].toUpperCase() +
            Complexity.simple.name.substring(1);
      case Complexity.challenging:
        return Complexity.challenging.name[0].toUpperCase() +
            Complexity.challenging.name.substring(1);
      case Complexity.hard:
        return Complexity.hard.name[0].toUpperCase() +
            Complexity.hard.name.substring(1);
    }
  }
}

enum Affordability {
  affordable,
  pricey,
  luxurious;

  String get getWord {
    switch (this) {
      case Affordability.affordable:
        return Affordability.affordable.name[0].toUpperCase() +
            Affordability.affordable.name.substring(1);
      case Affordability.pricey:
        return Affordability.pricey.name[0].toUpperCase() +
            Affordability.pricey.name.substring(1);
      case Affordability.luxurious:
        return Affordability.luxurious.name[0].toUpperCase() +
            Affordability.luxurious.name.substring(1);
    }
  }
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
