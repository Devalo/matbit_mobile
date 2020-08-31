import 'package:flutter/material.dart';
import 'package:matbit/widgets/app.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'recipeItem.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

// Sets up all recipes page
class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matbit'),
      ),
      body: _buildBody(context),
    );
  }
}

// Calls DB and collects recipes
Widget _buildBody(BuildContext context) {
  final recipes = Firestore.instance.collection('recipes').snapshots();

  return StreamBuilder<QuerySnapshot>(
      stream: recipes,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildCardView(context, snapshot.data.documents);
      });
}

// Splits recipes and builds each cards
Widget _buildCardView(BuildContext context, List<DocumentSnapshot> snapshot) {
  //var size = MediaQuery.of(context).size;
  //final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
  //final double itemWidth = size.width / 2;

  return Column(
    children: <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.fromLTRB(3, 10, 0, 10),
          child: Text(
            'Oppskrifter',
            style: TextStyle(
              fontSize: 38,
              fontFamily: 'Poppins',
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ),
      Expanded(
        child: GridView.count(
          //childAspectRatio: (itemWidth / itemHeight) + 0.2,
          childAspectRatio: 0.623,
          crossAxisCount: 2,
          children:
              snapshot.map((data) => buildCardItem(context, data)).toList(),
        ),
      ),
    ],
  );
}
