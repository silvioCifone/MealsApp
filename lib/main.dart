import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesScreen(),
      initialRoute: "/",
      //It defines the default route at start
      routes: {
        //"/": (context) => CategoriesScreen(), It's the same sintax of the home parameter in MaterialApp widget arguments
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
      },
    );
  }
}
