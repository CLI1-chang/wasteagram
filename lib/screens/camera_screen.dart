import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/screens/homepage.dart';
import 'package:wasteagram/screens/new_entry.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = '/detail-screen';

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File image;

  Future getImage() async {
    String unique = DateTime.now().toString();
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      StorageReference storageRef =
          FirebaseStorage.instance.ref().child('$unique');
      StorageUploadTask uploadTask = storageRef.putFile(image);
      await uploadTask.onComplete;
      final purl = await storageRef.getDownloadURL();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NewEntry(url: purl)));
    } else {
      // handle case of user not selecting a photo
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    }
  }

  void initState() {
    getImage();
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
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
