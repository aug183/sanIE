import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "picked" field.
  bool? _picked;
  bool get picked => _picked ?? false;
  bool hasPicked() => _picked != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "date_created" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "date_completed" field.
  DateTime? _dateCompleted;
  DateTime? get dateCompleted => _dateCompleted;
  bool hasDateCompleted() => _dateCompleted != null;

  // "is_priority" field.
  bool? _isPriority;
  bool get isPriority => _isPriority ?? false;
  bool hasIsPriority() => _isPriority != null;

  // "numberOfItems" field.
  int? _numberOfItems;
  int get numberOfItems => _numberOfItems ?? 0;
  bool hasNumberOfItems() => _numberOfItems != null;

  // "operator" field.
  DocumentReference? _operator;
  DocumentReference? get operator => _operator;
  bool hasOperator() => _operator != null;

  // "cancelled" field.
  bool? _cancelled;
  bool get cancelled => _cancelled ?? false;
  bool hasCancelled() => _cancelled != null;

  // "assigned" field.
  bool? _assigned;
  bool get assigned => _assigned ?? false;
  bool hasAssigned() => _assigned != null;

  void _initializeFields() {
    _picked = snapshotData['picked'] as bool?;
    _orderId = snapshotData['order_id'] as String?;
    _dateCreated = snapshotData['date_created'] as DateTime?;
    _dateCompleted = snapshotData['date_completed'] as DateTime?;
    _isPriority = snapshotData['is_priority'] as bool?;
    _numberOfItems = castToType<int>(snapshotData['numberOfItems']);
    _operator = snapshotData['operator'] as DocumentReference?;
    _cancelled = snapshotData['cancelled'] as bool?;
    _assigned = snapshotData['assigned'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  bool? picked,
  String? orderId,
  DateTime? dateCreated,
  DateTime? dateCompleted,
  bool? isPriority,
  int? numberOfItems,
  DocumentReference? operator,
  bool? cancelled,
  bool? assigned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'picked': picked,
      'order_id': orderId,
      'date_created': dateCreated,
      'date_completed': dateCompleted,
      'is_priority': isPriority,
      'numberOfItems': numberOfItems,
      'operator': operator,
      'cancelled': cancelled,
      'assigned': assigned,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.picked == e2?.picked &&
        e1?.orderId == e2?.orderId &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.dateCompleted == e2?.dateCompleted &&
        e1?.isPriority == e2?.isPriority &&
        e1?.numberOfItems == e2?.numberOfItems &&
        e1?.operator == e2?.operator &&
        e1?.cancelled == e2?.cancelled &&
        e1?.assigned == e2?.assigned;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.picked,
        e?.orderId,
        e?.dateCreated,
        e?.dateCompleted,
        e?.isPriority,
        e?.numberOfItems,
        e?.operator,
        e?.cancelled,
        e?.assigned
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
