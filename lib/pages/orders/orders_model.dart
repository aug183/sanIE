import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'orders_widget.dart' show OrdersWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class OrdersModel extends FlutterFlowModel<OrdersWidget> {
  ///  Local state fields for this page.

  List<OrdersRecord> orderList = [];
  void addToOrderList(OrdersRecord item) => orderList.add(item);
  void removeFromOrderList(OrdersRecord item) => orderList.remove(item);
  void removeAtIndexFromOrderList(int index) => orderList.removeAt(index);
  void insertAtIndexInOrderList(int index, OrdersRecord item) =>
      orderList.insert(index, item);
  void updateOrderListAtIndex(int index, Function(OrdersRecord) updateFn) =>
      orderList[index] = updateFn(orderList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Orders widget.
  List<OrdersRecord>? queryOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Orders widget.
  List<OrdersRecord>? queryOutputAdmin;
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
  List<ItemsRecord>? itemQuery1;
  // Stores action output result for [Custom Action - documenToDataType] action in Container widget.
  List<ItemTypeStruct>? dataTypeContent1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
