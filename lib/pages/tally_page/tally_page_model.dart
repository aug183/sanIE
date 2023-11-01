import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'tally_page_widget.dart' show TallyPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class TallyPageModel extends FlutterFlowModel<TallyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var scannedBarcode = '';
  // Stores action output result for [Custom Action - checkIfBarcodeIsNull] action in Button widget.
  bool? isBarcodeNull;
  // Stores action output result for [Custom Action - checkIfBarcodeExists] action in Button widget.
  bool? barcodeExists;
  // Stores action output result for [Custom Action - checkTallyAndQuantity] action in Button widget.
  bool? tallyLessThanQuantity;
  // Stores action output result for [Custom Action - returnDocumentNumber] action in Button widget.
  int? documentNumber;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
