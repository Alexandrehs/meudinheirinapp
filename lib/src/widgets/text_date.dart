import 'package:flutter/material.dart';

class TextDate extends StatelessWidget {
  final String _data;
  final String _horas;

  const TextDate(this._data, this._horas);

  @override
  Widget build(BuildContext context) {
    return Text(
      ' $_data as $_horas',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.grey[800],
      ),
    );
  }
}
