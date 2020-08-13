import 'package:flutter/material.dart';

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
          title: Text('New Entry'),
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
