import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/screens/new_entry.dart';
import 'package:wasteagram/screens/detail_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    DateTime now = document['date'].toDate();
    String formattedDate = DateFormat('EEEE, MMM d, y').format(now);
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              formattedDate,
              style: Theme.of(context).textTheme.headline6,
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewEntry()),
          );
        },
        child: Icon(Icons.photo_camera),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}