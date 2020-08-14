import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final picked = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      image = File(picked.path);
    });
  }

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
