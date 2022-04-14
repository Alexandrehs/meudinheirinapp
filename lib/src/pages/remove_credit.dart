import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meudinheirinapp/src/models/movimentacao.dart';
import 'package:meudinheirinapp/src/models/movimentacoes.dart';
import 'package:meudinheirinapp/src/models/saldo.dart';
import 'package:provider/provider.dart';

class RemoveCredit extends StatelessWidget {
  final _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final NumberFormat _numberInReal =
      NumberFormat.simpleCurrency(locale: 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    'Vai realmente quer fazer isso :(',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _inputController,
                decoration: const InputDecoration(
                  label: Text('Valor'),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Insira um valor antes.';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final saldo = Provider.of<Saldo>(context, listen: false).total;
            final removedSaldo =
                Provider.of<Saldo>(context, listen: false).remove(
              double.parse(_inputController.text),
            );
            if (removedSaldo) {
              Provider.of<Movimentacoes>(context, listen: false).add(
                Movimentacao(
                    valor: double.parse(_inputController.text),
                    data: DateTime.now(),
                    tipo: Etipos.saida),
              );
              Navigator.popAndPushNamed(context, '/dashboard');
            } else {
              final snackBar = SnackBar(
                content: Text(
                  'Saldo insuficiente :(, você possui ${_numberInReal.format(saldo)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
        label: const Text('Confirmar'),
      ),
    );
  }
}
