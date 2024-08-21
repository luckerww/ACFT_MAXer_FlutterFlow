import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_story_widget.dart' show CreateStoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateStoryModel extends FlutterFlowModel<CreateStoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for input_text_field widget.
  FocusNode? inputTextFieldFocusNode;
  TextEditingController? inputTextFieldTextController;
  String? Function(BuildContext, String?)?
      inputTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (chatCompletion)] action in Button widget.
  ApiCallResponse? apiResult0sx;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputTextFieldFocusNode?.dispose();
    inputTextFieldTextController?.dispose();
  }
}
