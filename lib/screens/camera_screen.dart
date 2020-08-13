import 'package:flutter/material.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File image;

  Future getImage() async {}

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Choose Photo'),
        ),
      ),
    );
  }
}
