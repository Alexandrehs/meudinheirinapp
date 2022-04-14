import 'package:flutter/material.dart';

class TextDescrition extends StatelessWidget {
  final String _label;

  const TextDescrition(this._label);

  @override
  Widget build(BuildContext context) {
    return Text(
      _label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
    );
  }
}
