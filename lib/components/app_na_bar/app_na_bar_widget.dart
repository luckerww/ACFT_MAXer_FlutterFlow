import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_na_bar_model.dart';
export 'app_na_bar_model.dart';

class AppNaBarWidget extends StatefulWidget {
  const AppNaBarWidget({
    super.key,
    required this.homeIconColor,
    required this.libraryIconColor,
    required this.profileconColor,
    bool? isHome,
  }) : this.isHome = isHome ?? true;

  final Color? homeIconColor;
  final Color? libraryIconColor;
  final Color? profileconColor;
  final bool isHome;

  @override
  State<AppNaBarWidget> createState() => _AppNaBarWidgetState();
}

class _AppNaBarWidgetState extends State<AppNaBarWidget> {
  late AppNaBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppNaBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(48.0, 10.0, 48.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_NA_BAR_COMP_Icon_i0sj9x97_ON_TAP');
                    logFirebaseEvent('Icon_update_app_state');
                    FFAppState().filePath = '';
                    FFAppState().isAudioStopped = true;
                    setState(() {});
                    logFirebaseEvent('Icon_navigate_to');

                    context.pushNamed(
                      'main_screen',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  },
                  child: Icon(
                    Icons.home,
                    color: widget!.homeIconColor,
                    size: 20.0,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('APP_NA_BAR_COMP_Icon_xn2rd0ho_ON_TAP');
                    logFirebaseEvent('Icon_update_app_state');
                    FFAppState().filePath = '';
                    FFAppState().isAudioStopped = true;
                    setState(() {});
                    logFirebaseEvent('Icon_navigate_to');

                    context.pushNamed(
                      'gallery_page',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  },
                  child: Icon(
                    Icons.grid_view_sharp,
                    color: widget!.libraryIconColor,
                    size: 22.0,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('APP_NA_BAR_COMP_Icon_3xmx31pa_ON_TAP');
                      logFirebaseEvent('Icon_update_app_state');
                      FFAppState().filePath = '';
                      FFAppState().isAudioStopped = true;
                      setState(() {});
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed(
                        'profile',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.person_outline_rounded,
                      color: widget!.profileconColor,
                      size: 26.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
