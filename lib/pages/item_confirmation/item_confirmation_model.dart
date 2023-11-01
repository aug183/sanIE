import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'item_confirmation_widget.dart' show ItemConfirmationWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class ItemConfirmationModel extends FlutterFlowModel<ItemConfirmationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var orderBarcode = '';
  // Stores action output result for [Custom Action - checkIfBarcodeIsNull] action in Button widget.
  bool? isBarcodeNull;
  // Stores action output result for [Custom Action - checkIfScannedOrderIsCorrect] action in Button widget.
  bool? isScannedOrderCorrect;
  AudioPlayer? soundPlayer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
