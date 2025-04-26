import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'profilecreate_widget.dart' show ProfilecreateWidget;
import 'package:flutter/material.dart';

class ProfilecreateModel extends FlutterFlowModel<ProfilecreateWidget> {
  ///  Local state fields for this component.

  String? name;

  int? age;

  int? number;

  LatLng? location;

  String? description;

  int? waterCounter;

  int? shleterCounter;

  int? clothesCounter;

  int? money;

  String? other;

  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourage widget.
  FocusNode? yourageFocusNode1;
  TextEditingController? yourageTextController1;
  String? Function(BuildContext, String?)? yourageTextController1Validator;
  // State field(s) for yourage widget.
  FocusNode? yourageFocusNode2;
  TextEditingController? yourageTextController2;
  String? Function(BuildContext, String?)? yourageTextController2Validator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for description widget.
  String? descriptionValue;
  FormFieldController<String>? descriptionValueController;
  // State field(s) for watercount widget.
  int? watercountValue;
  // State field(s) for sheltercount widget.
  int? sheltercountValue;
  // State field(s) for clothcount widget.
  int? clothcountValue;
  // State field(s) for money widget.
  FocusNode? moneyFocusNode;
  TextEditingController? moneyTextController;
  String? Function(BuildContext, String?)? moneyTextControllerValidator;
  // State field(s) for otherreq widget.
  FocusNode? otherreqFocusNode;
  TextEditingController? otherreqTextController;
  String? Function(BuildContext, String?)? otherreqTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourageFocusNode1?.dispose();
    yourageTextController1?.dispose();

    yourageFocusNode2?.dispose();
    yourageTextController2?.dispose();

    moneyFocusNode?.dispose();
    moneyTextController?.dispose();

    otherreqFocusNode?.dispose();
    otherreqTextController?.dispose();
  }
}
