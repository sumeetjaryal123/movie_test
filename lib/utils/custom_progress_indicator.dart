import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommonProgressIndicator extends StatelessWidget {
  var isLoading = false;

  CommonProgressIndicator(this.isLoading);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          color: Colors.transparent,
          child: isLoading
              ?  CircularProgressIndicator()
              : Container());
    } else {
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
  }
}
