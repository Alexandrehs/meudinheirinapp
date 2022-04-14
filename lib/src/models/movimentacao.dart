class Movimentacao {
  double valor;
  DateTime data;
  Etipos tipo;

  Movimentacao({required this.valor, required this.data, required this.tipo});
}

enum Etipos { entrada, saida }
