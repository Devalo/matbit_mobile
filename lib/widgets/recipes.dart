import 'package:flutter/material.dart';
import 'package:matbit/widgets/app.dart';

class Recipes extends StatefulWidget {
  @override
  _RecipesState createState() => _RecipesState();
}

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

Widget _buildBody(BuildContext context) {
  return _buildList(context, dummySnapshot);
}

Widget _buildList(BuildContext context, List<Map> snapshot) {
  return ListView(
    children: snapshot.map((data) => _buildListItem(context, data)).toList(),
  );
}

Widget _buildListItem(BuildContext context, Map data) {
  var _test = data.values.toList();

  print(_test);
  print(data["name"]);
  return Padding(
    padding: EdgeInsets.symmetric(),
    child: Container(
      child: ListTile(
        title: Text(data["name"]),
        onTap: () => print(data["name"]),
      ),
    ),
  );
}
