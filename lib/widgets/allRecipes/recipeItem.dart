import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

Widget buildCardItem(BuildContext context, DocumentSnapshot data) {
  if (data == null) {
    return Card(
      child: Text('Finner ingen oppskrifter'),
    );
  }
  return Card(
    child: Container(
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
                      Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
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
    ),
  );
}
