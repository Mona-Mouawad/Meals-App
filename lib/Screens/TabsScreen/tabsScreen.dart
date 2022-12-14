import 'package:flutter/material.dart';
import 'package:meals_app/Screens/TabsScreen/mainDrawer.dart';
import 'package:meals_app/Screens/categoriesScreen/categoriesScreen.dart';
import 'package:meals_app/Screens/favoritesScreen.dart';
import 'package:meals_app/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.category,
                  ),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(
                    Icons.star,
                  ),
                  text: 'Favorites',
                ),
              ],
            ),
          ),
          drawer: MainDrawer(),
          body: TabBarView(
            children: [
              CategoriesScreen(),
              FavoritesScreen(widget.favoriteMeals),
            ],
          ),
        ));
  }
}
