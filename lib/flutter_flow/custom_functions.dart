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
