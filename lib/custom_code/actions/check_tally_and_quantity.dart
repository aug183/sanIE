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

Future<bool> checkTallyAndQuantity(
  List<ItemTypeStruct> inputDataType,
  String input,
) async {
  // check if input exists in the list of data types
  for (var i = 0; i < inputDataType.length; i++) {
    if (inputDataType[i].barcode == input &&
        inputDataType[i].quantity > inputDataType[i].tally) {
      return true;
    }
  }
  return false;
}
