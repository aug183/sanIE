import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double progressOutput(List<ItemTypeStruct> listOfItems) {
  double totalQuantity = 0;
  double totalTally = 0;

  for (int x = 0; x < listOfItems.length; x++) {
    totalQuantity += listOfItems[x].quantity;
    totalTally += listOfItems[x].tally;
  }
  double progress = totalTally / totalQuantity;
  return progress;
}

String progressText(List<ItemTypeStruct> inputType) {
  double quantityTotal = 0;
  double tallyTotal = 0;

  for (int x = 0; x < inputType.length; x++) {
    quantityTotal += inputType[x].quantity;
    tallyTotal += inputType[x].tally;
  }
  double percent = (tallyTotal / quantityTotal) * 100;
  String output = percent.toStringAsPrecision(3);
  output = output + "%";
  return output;
}

bool checkIfProductInCart(
  List<ItemTypeStruct> cartList,
  String barCode,
) {
  for (var item in cartList) {
    if (item.barcode == barCode) {
      return true;
    }
  }
  return false;
}
