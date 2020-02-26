import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';

import 'package:meals_app/dummy-data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/category';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((c) => CategoryItem(
                id: c.id,
                title: c.title,
                color: c.color,
              ))
          .toList(),
    );
  }
}
