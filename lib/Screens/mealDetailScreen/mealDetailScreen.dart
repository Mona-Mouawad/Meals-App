import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/resources/color_manager.dart';
import 'package:meals_app/resources/values_manager.dart';



class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';


  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);


  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        border: Border.all(color: ColorManager.grey),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      margin: EdgeInsets.all(AppMargin.m10),
      padding: EdgeInsets.all(AppPadding.p10),
      height: AppSize.s150,
      width: AppSize.s300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    print('mealId');
    print(mealId);
    final selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id ==mealId );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: AppSize.s300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
        buildSectionTitle(context, 'Steps'),
        buildContainer(
          ListView.builder(
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${(index + 1)}'),
                  ),
                  title: Text(
                    selectedMeal.steps[index],style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Divider()
              ],
            ),
            itemCount: selectedMeal.steps.length,
          ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),onPressed: ()=> toggleFavorite(mealId) ,
      ),
    );
  }
}
