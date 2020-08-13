import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return MaterialApp(
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
