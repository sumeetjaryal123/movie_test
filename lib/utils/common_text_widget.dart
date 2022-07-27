import 'dart:io';

import 'package:flutter/cupertino.dart';



class CommonTextWidget extends StatelessWidget {
  late var text = "";
  var fontWeight;
  double fontSize;
  var fontColor;
  var textAlignment;
  var height;
  var wordSpacing;
  var textDecoration;
  final int? maxLines;
  final TextOverflow? overflow;
  var fontFamily;
  var decorationthickness;
  CommonTextWidget(
      {required this.text,
        this.fontWeight,
        required this.fontSize,
        this.fontColor,
        this.textAlignment,
        this.height,
        this.textDecoration,
        this.wordSpacing,
        this.maxLines,
        this.overflow,
        this.fontFamily,
        this.decorationthickness,
      });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlignment,
        maxLines: maxLines,
        overflow: overflow,
        softWrap: true,
        style: TextStyle(
            height: height != null ? height : 1.0,
            wordSpacing: wordSpacing,
            color: fontColor,
            fontWeight: fontWeight,
            decoration: textDecoration,
            decorationThickness: decorationthickness,
            fontSize: fontSize.toDouble()));
  }
}
