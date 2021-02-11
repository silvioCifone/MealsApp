import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  //final String categoryId;
  //final String categoryTitle;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArguments['title'];
    final categoryId = routeArguments['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}

//7.8
