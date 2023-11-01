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

Future<List<ItemTypeStruct>> documenToDataType(
    List<ItemsRecord> documentList) async {
  // list of document to list of datatype
  List<ItemTypeStruct> dataTypeList = [];

  for (var document in documentList) {
    ItemTypeStruct dataType = ItemTypeStruct(
      uid: document.reference,
      itemName: document.itemName,
      barcode: document.barcode,
      quantity: document.quantity,
      tally: document.tally,
      location: document.location,
    );
    dataTypeList.add(dataType);
  }

  return dataTypeList;
}
