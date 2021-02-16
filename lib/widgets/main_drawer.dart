import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerItems(String title, IconData icon, Function onItemTap) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onItemTap);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDrawerItems(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          buildDrawerItems(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
