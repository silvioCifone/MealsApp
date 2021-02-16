import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String _categoryTitle;
  List<Meal> _displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      this._categoryTitle = routeArguments['title'];
      final categoryId = routeArguments['id'];
      this._displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      this._loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _onMealRemove(String mealId) {
    setState(() {
      _displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem.name(
            _displayedMeals[index].id,
            _displayedMeals[index].title,
            _displayedMeals[index].imageUrl,
            _displayedMeals[index].duration,
            _displayedMeals[index].complexity,
            _displayedMeals[index].affordability,
            this._onMealRemove,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}

//7.8
