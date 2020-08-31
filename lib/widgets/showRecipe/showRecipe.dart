import 'package:flutter/material.dart';

class ShowRecipe extends StatelessWidget {
  final data;
  ShowRecipe({this.data});

  Widget build(BuildContext context) {
    print(data['title']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Matbit'),
      ),
      body: _recipeBody(context, data),
    );
  }
}

Widget _recipeBody(BuildContext context, recipe) {
  return Container(
    child: Text(recipe['title']),
  );
}
