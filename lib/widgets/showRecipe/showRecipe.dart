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
                    Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Icon(Icons.alarm),
                    ),
                    Text(recipe['cookTime']),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Icon(Icons.local_dining),
                    ),
                    Text(recipe['difficulty']),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 3.0),
                      child: Icon(Icons.supervised_user_circle),
                    ),
                    Text(recipe['servings']),
                    Text(recipe['servings'] == '1' ? ' porsjon' : ' porsjoner'),
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
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'Ingredienser',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
          Divider(),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            'Fremgangsmåte',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          child: Text(
                            recipe['description'],
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: _getTags(recipe['separatedTags']),
              ),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(recipe['username']),
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

  Widget _getTags(tags) {
    print(tags.join(','));
    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: 'Tags ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: tags.join(','),
          ),
        ],
      ),
    );
  }
}
