import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categoriesScreen/categoriesScreen.dart';
import 'package:meals_app/Screens/filtersScreen.dart';
import 'package:meals_app/Screens/filtersScreen.dart';
import 'package:meals_app/Screens/mealDetailScreen/mealDetailScreen.dart';
import 'package:meals_app/Screens/mealDetailScreen/mealDetailScreen.dart';
import 'package:meals_app/Screens/meals/categoryMealsScreen.dart';
import 'package:meals_app/Screens/TabsScreen/tabsScreen.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/resources/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: getTheme(),
      //   home: Container(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(toggleFavorite,_isMealFavorite ),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),

      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        if (settings.name == '/meal-detail') {
          return MaterialPageRoute(builder: (ctx) => Container());
        } else if (settings.name == '/something-else') {
          return MaterialPageRoute(
            builder: (ctx) => Scaffold(),
          );
          ;
        }
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
