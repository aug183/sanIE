import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }

  List<ItemTypeStruct> _itemAppState = [];
  List<ItemTypeStruct> get itemAppState => _itemAppState;
  set itemAppState(List<ItemTypeStruct> _value) {
    _itemAppState = _value;
  }

  void addToItemAppState(ItemTypeStruct _value) {
    _itemAppState.add(_value);
  }

  void removeFromItemAppState(ItemTypeStruct _value) {
    _itemAppState.remove(_value);
  }

  void removeAtIndexFromItemAppState(int _index) {
    _itemAppState.removeAt(_index);
  }

  void updateItemAppStateAtIndex(
    int _index,
    ItemTypeStruct Function(ItemTypeStruct) updateFn,
  ) {
    _itemAppState[_index] = updateFn(_itemAppState[_index]);
  }

  void insertAtIndexInItemAppState(int _index, ItemTypeStruct _value) {
    _itemAppState.insert(_index, _value);
  }

  int _totalItems = 0;
  int get totalItems => _totalItems;
  set totalItems(int _value) {
    _totalItems = _value;
  }

  List<ProductTypeStruct> _productList = [];
  List<ProductTypeStruct> get productList => _productList;
  set productList(List<ProductTypeStruct> _value) {
    _productList = _value;
  }

  void addToProductList(ProductTypeStruct _value) {
    _productList.add(_value);
  }

  void removeFromProductList(ProductTypeStruct _value) {
    _productList.remove(_value);
  }

  void removeAtIndexFromProductList(int _index) {
    _productList.removeAt(_index);
  }

  void updateProductListAtIndex(
    int _index,
    ProductTypeStruct Function(ProductTypeStruct) updateFn,
  ) {
    _productList[_index] = updateFn(_productList[_index]);
  }

  void insertAtIndexInProductList(int _index, ProductTypeStruct _value) {
    _productList.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
