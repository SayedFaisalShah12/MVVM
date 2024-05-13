import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message
    );
  }

  static flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          backgroundColor : Colors.red,
          duration: Duration(seconds: 3),
          positionOffset: 20,
          icon: Icon(Icons.dangerous),
        )..show(context),
    );
  }

  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}