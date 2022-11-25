import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filtersScreen.dart';
import 'package:meals_app/resources/font_manager.dart';
import 'package:meals_app/resources/strings_manager.dart';
import 'package:meals_app/resources/values_manager.dart';

class MainDrawer  extends StatelessWidget {
 Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
   return ListTile(
     leading: Icon(
       icon,
       size: AppSize.s28,
     ),
     title: Text(
       title,
       style: TextStyle(
         fontFamily: 'RobotoCondensed',
         fontSize: FontSize.s20,
         fontWeight: FontWeightManager.bold,
       ),
     ),
     onTap: tapHandler,
   );
 }
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Column(children: [
      Container(
        height: AppSize.s120,
        width: double.infinity,
        padding: EdgeInsets.all(AppPadding.p20),
        alignment: Alignment.centerLeft,
        color: Theme.of(context).accentColor,
        child: Text(
          AppStrings.Cooking_Up,
          style: Theme.of(context).textTheme.labelLarge
        ),
      ),
      SizedBox(
        height:AppSize.s20,
      ),
      buildListTile('Meals', Icons.restaurant, () {
        Navigator.of(context).pushReplacementNamed('/');
      }),
      buildListTile('Filters', Icons.settings, () {
        Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
      }),
    ]),);
  }
}
