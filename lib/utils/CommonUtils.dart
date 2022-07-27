

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/utils/all_constants.dart';

class CommonUtils{

  static Future<bool> checkConnectivity() async {
    bool isConnectd = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        isConnectd = true;
      } else {
        isConnectd = false;
      }
    } on SocketException catch (_) {
      log('not connected');
      isConnectd = false;
    }
    return isConnectd;
  }

  static void showToastBar(
      {required text, required color, required BuildContext? context}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}