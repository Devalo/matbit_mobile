import 'package:flutter/material.dart';

class ShowRecipe extends StatelessWidget {
  final data;
  ShowRecipe({this.data});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matbit'),
      ),
      body: _recipeBody(context, data),
    );
  }

  Widget _recipeBody(BuildContext context, recipe) {
    double screenWidth = MediaQuery.of(context).size.width * 0.9;
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 8 / 9,
                    child: Image.network(
                      recipe['imageUrl'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 7, 0, 0),
                    child: Text(
                      recipe['title'],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    width: screenWidth,
                    child: Text(
                      recipe['about'],
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.alarm),
                    Text(recipe['cookTime']),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.local_dining),
                    Text(recipe['difficulty']),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ingridienser',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ..._getIngredients(context, recipe['ingredients']),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _getIngredients(context, ingredients) {
    return ingredients
        .map<Widget>(
          (i) => Padding(
            padding: EdgeInsets.only(bottom: 2),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: '- ${i['amount']} ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${i['ingredient']}'),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
