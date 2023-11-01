import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'orders_widget.dart' show OrdersWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class OrdersModel extends FlutterFlowModel<OrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchField widget.
  final searchFieldKey = GlobalKey();
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  List<OrdersRecord> simpleSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ItemsRecord>? itemQuery;
  // Stores action output result for [Custom Action - documenToDataType] action in Container widget.
  List<ItemTypeStruct>? dataTypeContent;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ItemsRecord>? itemQuery2;
  // Stores action output result for [Custom Action - documenToDataType] action in Container widget.
  List<ItemTypeStruct>? dataTypeContent2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
