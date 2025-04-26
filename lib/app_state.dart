import 'package:flutter/material.dart';
import '/backend/backend.dart';

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

  Color _status = Color(4278255418);
  Color get status => _status;
  set status(Color value) {
    _status = value;
  }

  String _response = '';
  String get response => _response;
  set response(String value) {
    _response = value;
  }

  String _Question = '';
  String get Question => _Question;
  set Question(String value) {
    _Question = value;
  }

  List<LatLng> _locations = [];
  List<LatLng> get locations => _locations;
  set locations(List<LatLng> value) {
    _locations = value;
  }

  void addToLocations(LatLng value) {
    locations.add(value);
  }

  void removeFromLocations(LatLng value) {
    locations.remove(value);
  }

  void removeAtIndexFromLocations(int index) {
    locations.removeAt(index);
  }

  void updateLocationsAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    locations[index] = updateFn(_locations[index]);
  }

  void insertAtIndexInLocations(int index, LatLng value) {
    locations.insert(index, value);
  }

  LatLng? _coordinate;
  LatLng? get coordinate => _coordinate;
  set coordinate(LatLng? value) {
    _coordinate = value;
  }

  dynamic _form;
  dynamic get form => _form;
  set form(dynamic value) {
    _form = value;
  }

  List<dynamic> _form2 = [];
  List<dynamic> get form2 => _form2;
  set form2(List<dynamic> value) {
    _form2 = value;
  }

  void addToForm2(dynamic value) {
    form2.add(value);
  }

  void removeFromForm2(dynamic value) {
    form2.remove(value);
  }

  void removeAtIndexFromForm2(int index) {
    form2.removeAt(index);
  }

  void updateForm2AtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    form2[index] = updateFn(_form2[index]);
  }

  void insertAtIndexInForm2(int index, dynamic value) {
    form2.insert(index, value);
  }

  String _testnig = 'essay on books';
  String get testnig => _testnig;
  set testnig(String value) {
    _testnig = value;
  }

  dynamic _datafire;
  dynamic get datafire => _datafire;
  set datafire(dynamic value) {
    _datafire = value;
  }

  List<String> _DATASET = [];
  List<String> get DATASET => _DATASET;
  set DATASET(List<String> value) {
    _DATASET = value;
  }

  void addToDATASET(String value) {
    DATASET.add(value);
  }

  void removeFromDATASET(String value) {
    DATASET.remove(value);
  }

  void removeAtIndexFromDATASET(int index) {
    DATASET.removeAt(index);
  }

  void updateDATASETAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    DATASET[index] = updateFn(_DATASET[index]);
  }

  void insertAtIndexInDATASET(int index, String value) {
    DATASET.insert(index, value);
  }
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
