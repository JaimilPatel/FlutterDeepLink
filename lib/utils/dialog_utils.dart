import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants/dimens.dart';

class ToastUtils {
  //To Display Toast
  static Future<bool?> displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        timeInSecForIosWeb: 2,
        fontSize: labelFontSize);
  }
}
