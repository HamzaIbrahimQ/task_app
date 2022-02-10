import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class ProgressHud {
  static ProgressHud shared = ProgressHud();
  late BuildContext context;

  Widget createLoadingView() {
    return Stack(
      children: <Widget>[
        getCircularProgressIndicator(),
      ],
    );
  }

  Widget getCircularProgressIndicator({Color color = Colors.white}) => Center(
        child: SpinKitWave(
          color: color,
          size: 30.0,
        ),
      );

  void startLoading(BuildContext context) {
    ProgressHud.shared.context = context;

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async => false,
            child:
         createLoadingView());
      },
    );
  }

  void stopLoading() {
       Navigator.of(context).pop('Discard');
  }
}
