import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categoriesScreen/categoriesScreen.dart';
import 'package:meals_app/Screens/filtersScreen.dart';
import 'package:meals_app/Screens/filtersScreen.dart';
import 'package:meals_app/Screens/mealDetailScreen/mealDetailScreen.dart';
import 'package:meals_app/Screens/mealDetailScreen/mealDetailScreen.dart';
import 'package:meals_app/Screens/meals/categoryMealsScreen.dart';
import 'package:meals_app/Screens/TabsScreen/tabsScreen.dart';
import 'package:meals_app/resources/theme_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: getTheme(),
      //   home: Container(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        if (settings.name == '/meal-detail') {
          return MaterialPageRoute(builder: (ctx) => Container() );
        } else if (settings.name == '/something-else') {
          return  MaterialPageRoute(builder: (ctx) => Scaffold(),); ;
      }
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);

      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
    );
  }
}
