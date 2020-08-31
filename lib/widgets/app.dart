import 'package:flutter/material.dart';

import 'allRecipes/recipes.dart';
import 'showRecipe/showRecipe.dart';

class MatbitApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matbit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/showRecipe': (context) => ShowRecipe(),
      },
      home: Recipes(),
    );
  }
}
