import '/components/app_button/app_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'onboarding_slides_widget.dart' show OnboardingSlidesWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingSlidesModel extends FlutterFlowModel<OnboardingSlidesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for app_button component.
  late AppButtonModel appButtonModel1;
  // Model for app_button component.
  late AppButtonModel appButtonModel2;
  // Model for app_button component.
  late AppButtonModel appButtonModel3;

  @override
  void initState(BuildContext context) {
    appButtonModel1 = createModel(context, () => AppButtonModel());
    appButtonModel2 = createModel(context, () => AppButtonModel());
    appButtonModel3 = createModel(context, () => AppButtonModel());
  }

  @override
  void dispose() {
    appButtonModel1.dispose();
    appButtonModel2.dispose();
    appButtonModel3.dispose();
  }
}
