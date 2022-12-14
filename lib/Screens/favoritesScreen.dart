import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals/mealItem.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('The Favorites'),
      );
    } else
      return ListView.builder(
          itemBuilder: (context, index) => MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              affordability: favoriteMeals[index].affordability,
              complexity: favoriteMeals[index].complexity,
              duration: favoriteMeals[index].duration),
      itemCount: favoriteMeals.length,);
  }
}
