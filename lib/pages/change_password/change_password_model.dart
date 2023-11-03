import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode;
  TextEditingController? emailTextFieldController;
  String? Function(BuildContext, String?)? emailTextFieldControllerValidator;
  // State field(s) for currentPasswordField widget.
  FocusNode? currentPasswordFieldFocusNode;
  TextEditingController? currentPasswordFieldController;
  late bool currentPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      currentPasswordFieldControllerValidator;
  // State field(s) for newPasswordField widget.
  FocusNode? newPasswordFieldFocusNode;
  TextEditingController? newPasswordFieldController;
  late bool newPasswordFieldVisibility;
  String? Function(BuildContext, String?)? newPasswordFieldControllerValidator;
  // State field(s) for reenterPasswordField widget.
  FocusNode? reenterPasswordFieldFocusNode;
  TextEditingController? reenterPasswordFieldController;
  late bool reenterPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      reenterPasswordFieldControllerValidator;
  // Stores action output result for [Custom Action - changePassword] action in Button widget.
  bool? isSuccesful;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    currentPasswordFieldVisibility = false;
    newPasswordFieldVisibility = false;
    reenterPasswordFieldVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailTextFieldFocusNode?.dispose();
    emailTextFieldController?.dispose();

    currentPasswordFieldFocusNode?.dispose();
    currentPasswordFieldController?.dispose();

    newPasswordFieldFocusNode?.dispose();
    newPasswordFieldController?.dispose();

    reenterPasswordFieldFocusNode?.dispose();
    reenterPasswordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
