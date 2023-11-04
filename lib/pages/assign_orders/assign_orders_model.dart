import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/assign_picker/assign_picker_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'assign_orders_widget.dart' show AssignOrdersWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AssignOrdersModel extends FlutterFlowModel<AssignOrdersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchField widget.
  final searchFieldKey = GlobalKey();
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? searchFieldSelectedOption;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  List<OrdersRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
