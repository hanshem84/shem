import 'package:flutter/material.dart';

import 'style/default_text_style.dart';

class DefaultTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final bool overflow;

  const DefaultTextWidget({super.key, required this.text, required this.fontSize, required this.fontColor, required this.fontWeight, required this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: defaultTextStyle(fontSize, fontColor, fontWeight, overflow),
    );
  }
}
