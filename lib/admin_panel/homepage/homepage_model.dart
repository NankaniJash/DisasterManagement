import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'homepage_widget.dart' show HomepageWidget;
import 'package:flutter/material.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  Local state fields for this page.

  LatLng? fLocation;

  List<LatLng> ffLocation = [];
  void addToFfLocation(LatLng item) => ffLocation.add(item);
  void removeFromFfLocation(LatLng item) => ffLocation.remove(item);
  void removeAtIndexFromFfLocation(int index) => ffLocation.removeAt(index);
  void insertAtIndexInFfLocation(int index, LatLng item) =>
      ffLocation.insert(index, item);
  void updateFfLocationAtIndex(int index, Function(LatLng) updateFn) =>
      ffLocation[index] = updateFn(ffLocation[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Homepage widget.
  UsersRecord? dataretrieved;
  // Stores action output result for [Firestore Query - Query a collection] action in Homepage widget.
  UsersRecord? locationFirebase;
  // Stores action output result for [Firestore Query - Query a collection] action in Homepage widget.
  List<UsersRecord>? retrievedData;
  // Stores action output result for [Firestore Query - Query a collection] action in Homepage widget.
  UsersRecord? locations;
  // Stores action output result for [Backend Call - API (firestoredata)] action in Homepage widget.
  ApiCallResponse? apiResultyd7;
  // Stores action output result for [Backend Call - API (groq)] action in Homepage widget.
  ApiCallResponse? apiResultx06;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (firestoredata)] action in TextField widget.
  ApiCallResponse? responseGrok;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
