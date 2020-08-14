import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  final DateTime date;
  final String imageURL;
  final String latitude;
  final String longitude;
  final String quantity;
  DocumentReference reference;

  Posts(
      {this.date,
      this.imageURL,
      this.latitude,
      this.longitude,
      this.quantity,
      this.reference});
}
