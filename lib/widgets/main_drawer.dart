import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: ListTile(
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              // fontWeight: FontWeight.bold,
            ),
          ),
          onTap: tapHandler),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                'Cooking Up!',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile(
              'Meals',
              Icons.restaurant,
              () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            buildListTile(
              'Filters',
              Icons.settings,
              () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
