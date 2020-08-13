import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Wasteagram'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    DateTime now = document['date'].toDate();
    String formattedDate = DateFormat('MMM d y').format(now);
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              formattedDate,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['quantity'].toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
      onTap: () {
        print("Detail Screen will go here.");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data.documents.isEmpty)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemExtent: 80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListItem(context, snapshot.data.documents[index]),
            );
          }),
    );
  }
}
