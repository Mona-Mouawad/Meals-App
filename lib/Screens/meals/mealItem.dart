import 'package:flutter/material.dart';
import 'package:meals_app/Screens/mealDetailScreen/mealDetailScreen.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/resources/color_manager.dart';
import 'package:meals_app/resources/values_manager.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        elevation: AppSize.s4,
        margin: EdgeInsets.all(AppSize.s10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s15),
                    topRight: Radius.circular(AppSize.s15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: AppSize.s20,
                  right: AppSize.s10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .65,
                    color: ColorManager.lightGrey.withOpacity(.7),
                    padding: EdgeInsets.symmetric(
                      vertical: AppPadding.p5,
                      horizontal: AppPadding.p20,
                    ),
                    child: Text(
                      //  'hhh bvyhdfrt jiuytfvbnmloinnnnnnn cxsedrtyu kuhg',
                     title,
                      style: Theme.of(context).textTheme.bodyLarge,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(AppPadding.p20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    initRow('$duration min', Icons.schedule),
                    initRow(complexityText, Icons.work),
                    initRow(affordabilityText, Icons.attach_money),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  Widget initRow(String text, IconData icon) => Row(
        children: [
          Icon(icon),
          SizedBox(
            width: AppSize.s5,
          ),
          Text(text),
        ],
      );
}
