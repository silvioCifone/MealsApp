import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactoseFree = false;

  Widget _buildOptionsItems(String title, String subtitle, bool currentValue,
      Function onSwitchValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: onSwitchValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters!"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildOptionsItems(
                      "Gluten Free",
                      "Only include Gluten Free meals",
                      this._isGlutenFree,
                      (newValue) => setState(() {
                            _isGlutenFree = newValue;
                          })),
                  _buildOptionsItems(
                      "Lactose Free",
                      "Only include Lactose Free meals",
                      this._isLactoseFree,
                      (newValue) => setState(() {
                            _isLactoseFree = newValue;
                          })),
                  _buildOptionsItems(
                      "Vegetarian",
                      "Only include Vegetarian meals",
                      this._isVegetarian,
                      (newValue) => setState(() {
                            _isVegetarian = newValue;
                          })),
                  _buildOptionsItems(
                      "Vegan",
                      "Only include Vegan meals",
                      this._isVegan,
                      (newValue) => setState(() {
                            _isVegan = newValue;
                          })),
                ],
              ),
            ),
          ],
        ));
  }
}
