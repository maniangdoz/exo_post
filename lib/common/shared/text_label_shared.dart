import 'package:flutter/material.dart';

class TextLabelShared extends StatelessWidget {
  final Color colorTextLabel;
  final String labelText;
  final double sizeLabelText;
  final FontWeight fontLabelText;
  final VoidCallback? onClick;
  const TextLabelShared(
      {Key? key,
      required this.colorTextLabel,
      required this.labelText,
      required this.sizeLabelText,
      required this.fontLabelText,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: sizeLabelText,
          color: colorTextLabel,
          fontWeight: fontLabelText,
        ),
      ),
    );
  }
}
