// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemTypeStruct extends FFFirebaseStruct {
  ItemTypeStruct({
    String? barcode,
    DocumentReference? uid,
    int? quantity,
    int? tally,
    String? location,
    String? itemName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _barcode = barcode,
        _uid = uid,
        _quantity = quantity,
        _tally = tally,
        _location = location,
        _itemName = itemName,
        super(firestoreUtilData);

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  set uid(DocumentReference? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "tally" field.
  int? _tally;
  int get tally => _tally ?? 0;
  set tally(int? val) => _tally = val;
  void incrementTally(int amount) => _tally = tally + amount;
  bool hasTally() => _tally != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;
  bool hasLocation() => _location != null;

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;
  bool hasItemName() => _itemName != null;

  static ItemTypeStruct fromMap(Map<String, dynamic> data) => ItemTypeStruct(
        barcode: data['barcode'] as String?,
        uid: data['uid'] as DocumentReference?,
        quantity: castToType<int>(data['quantity']),
        tally: castToType<int>(data['tally']),
        location: data['location'] as String?,
        itemName: data['item_name'] as String?,
      );

  static ItemTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ItemTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'barcode': _barcode,
        'uid': _uid,
        'quantity': _quantity,
        'tally': _tally,
        'location': _location,
        'item_name': _itemName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.DocumentReference,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'tally': serializeParam(
          _tally,
          ParamType.int,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'item_name': serializeParam(
          _itemName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemTypeStruct(
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['orders', 'items'],
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        tally: deserializeParam(
          data['tally'],
          ParamType.int,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        itemName: deserializeParam(
          data['item_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemTypeStruct &&
        barcode == other.barcode &&
        uid == other.uid &&
        quantity == other.quantity &&
        tally == other.tally &&
        location == other.location &&
        itemName == other.itemName;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([barcode, uid, quantity, tally, location, itemName]);
}

ItemTypeStruct createItemTypeStruct({
  String? barcode,
  DocumentReference? uid,
  int? quantity,
  int? tally,
  String? location,
  String? itemName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ItemTypeStruct(
      barcode: barcode,
      uid: uid,
      quantity: quantity,
      tally: tally,
      location: location,
      itemName: itemName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ItemTypeStruct? updateItemTypeStruct(
  ItemTypeStruct? itemType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    itemType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addItemTypeStructData(
  Map<String, dynamic> firestoreData,
  ItemTypeStruct? itemType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (itemType == null) {
    return;
  }
  if (itemType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && itemType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final itemTypeData = getItemTypeFirestoreData(itemType, forFieldValue);
  final nestedData = itemTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = itemType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getItemTypeFirestoreData(
  ItemTypeStruct? itemType, [
  bool forFieldValue = false,
]) {
  if (itemType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(itemType.toMap());

  // Add any Firestore field values
  itemType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getItemTypeListFirestoreData(
  List<ItemTypeStruct>? itemTypes,
) =>
    itemTypes?.map((e) => getItemTypeFirestoreData(e, true)).toList() ?? [];
