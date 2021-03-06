import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSctionTitle(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: 30,
        left: 20,
        bottom: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromRGBO(80, 80, 80, 1),
          fontSize: 35,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child, double height) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 5),
      height: height,
      decoration: BoxDecoration(
          // border:
          //     Border.all(width: 0.5, color: Color.fromRGBO(30, 30, 30, 1)),
          ),
      // width: 300,

      child: Scrollbar(
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSctionTitle('Ingredients'),
            buildContainer(
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) => Container(
                    width: 150,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // elevation: 3,
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 25,
                          bottom: 20,
                          left: 15,
                          right: 15,
                        ),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
                100),
            buildSctionTitle('Steps'),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ]),
                  itemCount: selectedMeal.steps.length,
                ),
                400)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourite(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
