import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'tally_page_model.dart';
export 'tally_page_model.dart';

class TallyPageWidget extends StatefulWidget {
  const TallyPageWidget({
    Key? key,
    required this.orderRef,
    required this.orderID,
  }) : super(key: key);

  final DocumentReference? orderRef;
  final String? orderID;

  @override
  _TallyPageWidgetState createState() => _TallyPageWidgetState();
}

class _TallyPageWidgetState extends State<TallyPageWidget> {
  late TallyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TallyPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              _model.scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
                '#C62828', // scanning line color
                'Cancel', // cancel button text
                true, // whether to show the flash icon
                ScanMode.BARCODE,
              );

              _model.isBarcodeNull = await actions.checkIfBarcodeIsNull(
                _model.scannedBarcode!,
              );
              if (!_model.isBarcodeNull!) {
                _model.barcodeExists = await actions.checkIfBarcodeExists(
                  FFAppState().itemAppState.toList(),
                  _model.scannedBarcode!,
                );
                if (_model.barcodeExists!) {
                  _model.tallyLessThanQuantity =
                      await actions.checkTallyAndQuantity(
                    FFAppState().itemAppState.toList(),
                    _model.scannedBarcode!,
                  );
                  if (_model.tallyLessThanQuantity!) {
                    _model.documentNumber = await actions.returnDocumentNumber(
                      FFAppState().itemAppState.toList(),
                      _model.scannedBarcode!,
                    );

                    context.pushNamed(
                      'itemConfirmation',
                      queryParameters: {
                        'documentNumber': serializeParam(
                          _model.documentNumber,
                          ParamType.int,
                        ),
                        'orderID': serializeParam(
                          widget.orderID,
                          ParamType.String,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                        ),
                      },
                    );
                  } else {
                    // Play Warning
                    _model.soundPlayer1 ??= AudioPlayer();
                    if (_model.soundPlayer1!.playing) {
                      await _model.soundPlayer1!.stop();
                    }
                    _model.soundPlayer1!.setVolume(1.0);
                    _model.soundPlayer1!
                        .setAsset('assets/audios/MGS_ALERT_sound_effect.mp3')
                        .then((_) => _model.soundPlayer1!.play());

                    HapticFeedback.mediumImpact();
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Warning'),
                          content: Text('Tally is more than Quantity'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  // Play Warning 2
                  _model.soundPlayer2 ??= AudioPlayer();
                  if (_model.soundPlayer2!.playing) {
                    await _model.soundPlayer2!.stop();
                  }
                  _model.soundPlayer2!.setVolume(1.0);
                  _model.soundPlayer2!
                      .setAsset('assets/audios/MGS_ALERT_sound_effect.mp3')
                      .then((_) => _model.soundPlayer2!.play());

                  HapticFeedback.mediumImpact();
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Warning'),
                        content: Text('Item not in the order list'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }

              setState(() {});
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 8.0,
            child: Icon(
              Icons.photo_camera,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            iconTheme:
                IconThemeData(color: FlutterFlowTheme.of(context).secondary),
            automaticallyImplyLeading: false,
            leading: Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Notice'),
                            content: Text('Cancel order tracking?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    FFAppState().itemAppState = [];
                    context.safePop();
                  }
                },
                child: Text(
                  'Cancel',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            actions: [],
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                  child: Text(
                    'Items needed',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Outfit',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
              titlePadding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            ),
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final displayItems = FFAppState().itemAppState.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: displayItems.length,
                          itemBuilder: (context, displayItemsIndex) {
                            final displayItemsItem =
                                displayItems[displayItemsIndex];
                            return Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Pick',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          (displayItemsItem.quantity -
                                                  displayItemsItem.tally)
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.6,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                displayItemsItem.itemName,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                minFontSize: 10.0,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Location: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  ),
                                                  Text(
                                                    displayItemsItem.location,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: LinearPercentIndicator(
                          percent: functions.progressOutput(
                              FFAppState().itemAppState.toList()),
                          lineHeight: 50.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).primary,
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                          center: Text(
                            functions.progressText(
                                FFAppState().itemAppState.toList()),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                          barRadius: Radius.circular(12.0),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
