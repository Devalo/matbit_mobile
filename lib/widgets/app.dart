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
      onGenerateRoute: (settings) {
        print(settings.name);
        if (settings.name == '/showRecipe') {
          var args = settings.arguments;

          return MaterialPageRoute(
            builder: (_) => ShowRecipe(
              data: args,
            ),
          );
        }
      },
      home: Recipes(),
    );
  }
}
