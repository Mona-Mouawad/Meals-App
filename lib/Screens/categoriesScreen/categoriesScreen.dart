import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categoriesScreen/categoryItem.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/resources/values_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(
      //   title: const Text('DeliMeal'),
      // ),
      // body:
      GridView(
        padding: const EdgeInsets.all(AppSize.s20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSize.s200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: AppSize.s20,
            mainAxisSpacing: AppSize.s20),
        children: DUMMY_CATEGORIES
            .map(
              (categoriesData) => CategoryItem(categoriesData.id,
                  categoriesData.title, categoriesData.color),
            )
            .toList(),
   //   ),
    );
  }
}
