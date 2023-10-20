import 'package:flutter/material.dart';

class TextLabelShared extends StatelessWidget {
  final Color colorTextLabel;
  final String labelText;
  final double sizeLabelText;
  final FontWeight fontLabelText;
  const TextLabelShared(
      {Key? key,
      required this.colorTextLabel,
      required this.labelText,
      required this.sizeLabelText,
      required this.fontLabelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style: TextStyle(
          fontSize: sizeLabelText,
          color: colorTextLabel,
          fontWeight: fontLabelText),
    );
  }
}
