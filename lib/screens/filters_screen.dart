import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Function onFiltersSave;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.onFiltersSave, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree;
  var _isVegetarian;
  var _isVegan;
  var _isLactoseFree;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters["isGlutenFree"];
    _isVegetarian = widget.currentFilters["isVegetarian"];
    _isVegan = widget.currentFilters["isVegan"];
    _isLactoseFree = widget.currentFilters["isLactoseFree"];
    super.initState();
  }

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
          actions: [
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () {
                Map<String, bool> newFilters = {
                  "isGlutenFree": this._isGlutenFree,
                  "isLactoseFree": this._isLactoseFree,
                  "isVegan": this._isVegan,
                  "isVegetarian": this._isVegetarian,
                };
                widget.onFiltersSave(newFilters);
              },
            )
          ],
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
