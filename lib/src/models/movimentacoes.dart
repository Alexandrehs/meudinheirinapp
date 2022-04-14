import 'package:flutter/material.dart';
import 'package:meudinheirinapp/src/models/movimentacao.dart';

class Movimentacoes extends ChangeNotifier {
  final List<Movimentacao> _listMovimentacoes = [];

  List<Movimentacao> get listMovimentacoes => _listMovimentacoes;

  add(Movimentacao movimentacao) {
    _listMovimentacoes.add(movimentacao);
    notifyListeners();
  }
}
