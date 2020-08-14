import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:wasteagram/screens/homepage.dart';

class NewEntry extends StatefulWidget {
  String url;
  NewEntry({Key key, this.url}) : super(key: key);
  static const routeName = '/new-entry';

  @override
  _NewEntryState createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  LocationData locationData;

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState(() {});
  }

  Widget build(BuildContext context) {
    if (locationData == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              ),
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
}
