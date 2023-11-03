// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future createOrder(
  List<ItemTypeStruct> orderItems,
  DateTime dateCreated,
  int totalItem,
  bool isPriority,
) async {
  // Add your function code here!
  final item = FirebaseFirestore.instance.collection('orders').doc();
  final data = {
    'order_id': item.id,
    'date_created': dateCreated,
    'picked': false,
    'cancelled': false,
    'numberOfItems': totalItem,
    'is_priority': isPriority,
    'assigned': false,
  };

  await item.set(data);

  for (var product in orderItems) {
    final productData = {
      'barcode': product.barcode,
      'item_name': product.itemName,
      'location': product.location,
      'quantity': product.quantity,
      'tally': 0,
    };
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(item.id)
        .collection('items')
        .doc()
        .set(productData);
  }
}
