import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_products_page_widget.dart' show AddProductsPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductsPageModel extends FlutterFlowModel<AddProductsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for barcode widget.
  FocusNode? barcodeFocusNode;
  TextEditingController? barcodeController;
  String? Function(BuildContext, String?)? barcodeControllerValidator;
  // State field(s) for ItemName widget.
  FocusNode? itemNameFocusNode;
  TextEditingController? itemNameController;
  String? Function(BuildContext, String?)? itemNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ImageLink widget.
  FocusNode? imageLinkFocusNode;
  TextEditingController? imageLinkController;
  String? Function(BuildContext, String?)? imageLinkControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    barcodeFocusNode?.dispose();
    barcodeController?.dispose();

    itemNameFocusNode?.dispose();
    itemNameController?.dispose();

    imageLinkFocusNode?.dispose();
    imageLinkController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
