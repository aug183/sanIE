import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_product_quantity_model.dart';
export 'change_product_quantity_model.dart';

class ChangeProductQuantityWidget extends StatefulWidget {
  const ChangeProductQuantityWidget({
    Key? key,
    required this.inputDatatype,
    required this.itemIndex,
  }) : super(key: key);

  final ItemTypeStruct? inputDatatype;
  final int? itemIndex;

  @override
  _ChangeProductQuantityWidgetState createState() =>
      _ChangeProductQuantityWidgetState();
}

class _ChangeProductQuantityWidgetState
    extends State<ChangeProductQuantityWidget> {
  late ChangeProductQuantityModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeProductQuantityModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
      child: Container(
        width: 300.0,
        height: 290.0,
        constraints: BoxConstraints(
          minHeight: 290.0,
          maxHeight: 300.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 0.0),
                child: Text(
                  'Change Quantity?',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: AutoSizeText(
                    valueOrDefault<String>(
                      widget.inputDatatype?.itemName,
                      'null',
                    ).maybeHandleOverflow(
                      maxChars: 30,
                      replacement: '…',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 18.0,
                        ),
                    minFontSize: 8.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 0.0, 0.0),
                child: Text(
                  'Quantity:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 18.0,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Container(
                    width: 120.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                    ),
                    child: FlutterFlowCountController(
                      decrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.minus,
                        color: enabled
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        size: 20.0,
                      ),
                      incrementIconBuilder: (enabled) => FaIcon(
                        FontAwesomeIcons.plus,
                        color: enabled
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).alternate,
                        size: 20.0,
                      ),
                      countBuilder: (count) => Text(
                        count.toString(),
                        style: FlutterFlowTheme.of(context).labelLarge,
                      ),
                      count: _model.countControllerValue ??=
                          widget.inputDatatype!.quantity,
                      updateCount: (count) =>
                          setState(() => _model.countControllerValue = count),
                      stepSize: 1,
                      minimum: 1,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).accent4,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(7.0, 7.0, 7.0, 7.0),
                        child: Text(
                          'Cancel',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        setState(() {
                          FFAppState().totalItems = FFAppState().totalItems -
                              (widget.inputDatatype!.quantity -
                                  _model.countControllerValue!);
                          FFAppState().updateItemAppStateAtIndex(
                            widget.itemIndex!,
                            (e) => e..quantity = _model.countControllerValue,
                          );
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Item updated',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).success,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              7.0, 7.0, 7.0, 7.0),
                          child: Text(
                            'Confirm',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
