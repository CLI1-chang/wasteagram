import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detail-screen';
  DocumentSnapshot document;
  DetailScreen({Key key, this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Detail Screen'),
        ),
        body: RaisedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Save Entry')),
      ),
    );
  }
}
