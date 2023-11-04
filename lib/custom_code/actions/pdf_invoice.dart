// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

Future pdfInvoice(
  OrdersRecord orderDetails,
  List<ItemsRecord> itemList,
  String picker,
  DateTime dateTimeGenerated,
) async {
  // generate a pdf invoice from the arguments
  final pdf = pw.Document();

// Add invoice header
  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.letter,
      margin: const pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 0,
            child: pw.Text('Invoice'),
          ),
          pw.SizedBox(height: 20),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Order ID: ${orderDetails.orderId}'),
              pw.Text('Date Created: ${orderDetails.dateCreated.toString()}'),
              pw.Text(
                  'Date Completed: ${orderDetails.dateCompleted.toString()}'),
              pw.Text('Picker: ${picker}'),
            ],
          ),
          pw.Divider(thickness: 2),
          pw.SizedBox(height: 20),
          pw.TableHelper.fromTextArray(
            context: context,
            data: <List<String>>[
              <String>['Barcode', 'Item Name', 'Quantity'],
              ...itemList.map((item) => [
                    item.barcode,
                    item.itemName.toString(),
                    item.quantity.toString(),
                  ]),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Footer(
            leading: pw.Text('Report Generated: ${dateTimeGenerated}'),
          ),
        ];
      },
    ),
  );

// Print the invoice
  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdf.save(),
  );
}
