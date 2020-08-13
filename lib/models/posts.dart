import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  final DateTime date;
  final String imageURL;
  final String lat_long;
  final String quantity;
  DocumentReference reference;

  Posts(
      {this.date, this.imageURL, this.lat_long, this.quantity, this.reference});
}
