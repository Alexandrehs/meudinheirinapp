import 'package:flutter/material.dart';

class Saldo extends ChangeNotifier {
  double _total = 0;
  double get total => _total;

  add(double value) async {
    _total = _total + value;
    notifyListeners();
  }

  bool remove(double value) {
    if (value < _total) {
      _total = _total - value;
      notifyListeners();
      return true;
    }

    return false;
  }
}
