import 'package:flutter/material.dart';
import 'package:matbit/widgets/app.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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

// Colls DB and collects recipes
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
  return GridView.count(
    crossAxisCount: 2,
    children: snapshot.map((data) => _buildCardItem(context, data)).toList(),
  );
}

Widget _buildCardItem(BuildContext context, DocumentSnapshot data) {
/*   if (data == null) {
    return <Card>[];
  } */
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: 7 / 5,
          child: Image.network(
            data['imageUrl'],
            fit: BoxFit.fitWidth,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(data['title']),
                    Text(data['likes'].length.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('${data['servings']} porsjoner'),
                    Text(data['likes'].length.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
