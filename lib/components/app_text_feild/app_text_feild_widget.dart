import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_text_feild_model.dart';
export 'app_text_feild_model.dart';

class AppTextFeildWidget extends StatefulWidget {
  const AppTextFeildWidget({
    super.key,
    required this.labelTxt,
    this.action,
  });

  final String? labelTxt;
  final Future Function()? action;

  @override
  State<AppTextFeildWidget> createState() => _AppTextFeildWidgetState();
}

class _AppTextFeildWidgetState extends State<AppTextFeildWidget> {
  late AppTextFeildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppTextFeildModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      onFieldSubmitted: (_) async {
        logFirebaseEvent('APP_TEXT_FEILD_TextField_o2h9pytc_ON_TEX');
        logFirebaseEvent('TextField_execute_callback');
        await widget.action?.call();
      },
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        labelText: widget!.labelTxt,
        labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Roboto',
              color: FlutterFlowTheme.of(context).alternate,
              letterSpacing: 0.0,
            ),
        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
              fontFamily: 'Roboto',
              letterSpacing: 0.0,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).alternate,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: EdgeInsets.all(20.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Roboto',
            letterSpacing: 0.0,
          ),
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
