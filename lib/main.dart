import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "isGlutenFree": false,
    "isLactoseFree": false,
    "isVegan": false,
    "isVegetarian": false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters["isGlutenFree"] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters["isLactoseFree"] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters["isVegan"] && !meal.isVegan) {
          return false;
        }
        if (_filters["isVegetarian"] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
      home: TabsScreen(),
      initialRoute: "/",
      //It defines the default route at start
      routes: {
        //"/": (context) => CategoriesScreen(), It's the same sintax of the home parameter in MaterialApp widget arguments
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(_setFilters, _filters),
      },
      /** It's called every times that we use a non existent route. In this case
       * if we comment row 40, clicking in a meal item redirect to Categories
       * Screen. It's used for dynamic routes
       */
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
      /**
       * It's called when flutter fail to build a route with any other method,
       * onGenerateRoute included
       */
      onUnknownRoute: (settings) {
        //should return an error page or something like this
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
