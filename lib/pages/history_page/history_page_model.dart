import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'history_page_widget.dart' show HistoryPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryPageModel extends FlutterFlowModel<HistoryPageWidget> {
  ///  Local state fields for this page.

  List<OrdersRecord> listQuery = [];
  void addToListQuery(OrdersRecord item) => listQuery.add(item);
  void removeFromListQuery(OrdersRecord item) => listQuery.remove(item);
  void removeAtIndexFromListQuery(int index) => listQuery.removeAt(index);
  void insertAtIndexInListQuery(int index, OrdersRecord item) =>
      listQuery.insert(index, item);
  void updateListQueryAtIndex(int index, Function(OrdersRecord) updateFn) =>
      listQuery[index] = updateFn(listQuery[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in historyPage widget.
  List<OrdersRecord>? outputAdmin;
  // Stores action output result for [Firestore Query - Query a collection] action in historyPage widget.
  List<OrdersRecord>? outputPicker;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ItemsRecord>? itemQuery;
  // Stores action output result for [Custom Action - documenToDataType] action in Container widget.
  List<ItemTypeStruct>? dataTypeOutput;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
