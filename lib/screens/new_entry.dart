import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewEntry extends StatefulWidget {
  static const routeName = '/new-entry';

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('New Entry'),
        ),
        body: RaisedButton(
            child: Text('Save Entry'),
            onPressed: () {
              Firestore.instance.collection('posts').add({
                'date': DateTime.now(),
                'quantity': 9,
                'imageURL': 'neopets.com',
              });
            }),
      ),
    );
  }
}
