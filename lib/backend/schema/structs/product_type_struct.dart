// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductTypeStruct extends FFFirebaseStruct {
  ProductTypeStruct({
    String? barcode,
    String? itemName,
    String? location,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _barcode = barcode,
        _itemName = itemName,
        _location = location,
        super(firestoreUtilData);

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;
  bool hasItemName() => _itemName != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  static ProductTypeStruct fromMap(Map<String, dynamic> data) =>
      ProductTypeStruct(
        barcode: data['barcode'] as String?,
        itemName: data['item_name'] as String?,
        location: data['location'] as String?,
      );

  static ProductTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProductTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'barcode': _barcode,
        'item_name': _itemName,
        'location': _location,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'item_name': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductTypeStruct(
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        itemName: deserializeParam(
          data['item_name'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductTypeStruct &&
        barcode == other.barcode &&
        itemName == other.itemName &&
        location == other.location;
  }

  @override
  int get hashCode => const ListEquality().hash([barcode, itemName, location]);
}

ProductTypeStruct createProductTypeStruct({
  String? barcode,
  String? itemName,
  String? location,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductTypeStruct(
      barcode: barcode,
      itemName: itemName,
      location: location,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductTypeStruct? updateProductTypeStruct(
  ProductTypeStruct? productType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductTypeStructData(
  Map<String, dynamic> firestoreData,
  ProductTypeStruct? productType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productType == null) {
    return;
  }
  if (productType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productTypeData =
      getProductTypeFirestoreData(productType, forFieldValue);
  final nestedData =
      productTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductTypeFirestoreData(
  ProductTypeStruct? productType, [
  bool forFieldValue = false,
]) {
  if (productType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productType.toMap());

  // Add any Firestore field values
  productType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductTypeListFirestoreData(
  List<ProductTypeStruct>? productTypes,
) =>
    productTypes?.map((e) => getProductTypeFirestoreData(e, true)).toList() ??
    [];
