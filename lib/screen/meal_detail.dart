import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget _buildTitle(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  List<Widget> _buildList(List<String> arr) {
    return arr
        .asMap()
        .map((index, element) {
          return MapEntry(
            index,
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                '${index + 1}. $element',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          );
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetail = DUMMY_MEALS.singleWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Hero(
              tag: mealDetail.id,
              child: Image.network(
                mealDetail.imageUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildTitle(context, "Ingredients"),
                  ..._buildList(mealDetail.ingredients),
                  _buildTitle(context, "Steps"),
                  ..._buildList(mealDetail.steps)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
