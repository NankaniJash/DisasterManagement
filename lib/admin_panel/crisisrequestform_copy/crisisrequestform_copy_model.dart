import '/flutter_flow/flutter_flow_util.dart';
import 'crisisrequestform_copy_widget.dart' show CrisisrequestformCopyWidget;
import 'package:flutter/material.dart';

class CrisisrequestformCopyModel
    extends FlutterFlowModel<CrisisrequestformCopyWidget> {
  ///  Local state fields for this component.

  int? waterCounter;

  int? shelterCounter;

  int? clotherCounter;

  int? moneyCounter;

  ///  State fields for stateful widgets in this component.

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = FFPlace();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();
  }

  /// Action blocks.
  Future<LatLng?> fetch(BuildContext context) async {
    return null;
  }
}
