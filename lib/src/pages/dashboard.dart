import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meudinheirinapp/src/models/movimentacoes.dart';
import 'package:meudinheirinapp/src/models/saldo.dart';
import 'package:meudinheirinapp/src/widgets/text_date.dart';
import 'package:meudinheirinapp/src/widgets/text_descrition.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  DateFormat horaFormatada = DateFormat('HH:mm:ss');
  DateFormat dataFormata = DateFormat('dd MM yyyy');
  @override
  Widget build(BuildContext context) {
    NumberFormat _numberInReal = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Alexandre, Silva',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600]),
                  ),
                  const Icon(
                    Icons.circle,
                    size: 60,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 16, top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        Consumer<Saldo>(
                          builder: (context, value, child) => Text(
                            _numberInReal.format(value.total),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Recentes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
            Expanded(
              child: Consumer<Movimentacoes>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ListView.builder(
                      reverse:
                          value.listMovimentacoes.length > 5 ? true : false,
                      shrinkWrap: true,
                      itemCount: value.listMovimentacoes.length,
                      itemBuilder: ((context, index) {
                        var _movimentacao = value.listMovimentacoes[index];
                        IconData _iconTipo;
                        String _tipo;
                        if (_movimentacao.tipo.name == 'entrada') {
                          _tipo = 'Entrada';
                          _iconTipo = Icons.arrow_circle_up_outlined;
                        } else {
                          _tipo = 'Saída';
                          _iconTipo = Icons.arrow_circle_down_outlined;
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child:
                              //Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Icon(
                              //           _iconTipo,
                              //           size: 45,
                              //           color: _tipo == 'Entrada'
                              //               ? Colors.green[500]
                              //               : Colors.red[500],
                              //         ),
                              //         TextDescrition(' $_tipo em '),
                              //         TextDate(
                              //           dataFormata.format(_movimentacao.data),
                              //           horaFormatada.format(_movimentacao.data),
                              //         ),
                              //       ],
                              //     ),
                              //     Text(
                              //       _numberInReal.format(_movimentacao.valor),
                              //       style: const TextStyle(
                              //         fontSize: 20,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              ListTile(
                            leading: Icon(
                              _iconTipo,
                              size: 45,
                              color: _tipo == 'Entrada'
                                  ? Colors.green[500]
                                  : Colors.red[500],
                            ),
                            title: Text(
                              _numberInReal.format(_movimentacao.valor),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                TextDescrition(' $_tipo em '),
                                TextDate(
                                  dataFormata.format(_movimentacao.data),
                                  horaFormatada.format(_movimentacao.data),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/selectOperation');
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }
}
