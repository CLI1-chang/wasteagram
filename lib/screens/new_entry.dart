import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
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
  final formKey = GlobalKey<FormState>();

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
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          accentColor: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
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
          body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                // this is here so I don't get pixel overflows when using
                // the keyboard (cmd + k to show it on iOS emulator)
                child: Column(
                  children: [
                    Container(
                        height: 350.0,
                        width: 350.0,
                        child: Image.network(widget.url)),
                    Container(
                      width: 300.0,
                      margin: const EdgeInsets.only(bottom: 25.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: new InputDecoration(
                            labelText: "Number of items wasted"),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    RaisedButton(
                        color: Colors.white,
                        child: Text('Submit',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        onPressed: () async {
                          formKey.currentState.save();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
