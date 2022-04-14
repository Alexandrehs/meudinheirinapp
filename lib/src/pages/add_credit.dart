import 'package:flutter/material.dart';
import 'package:meudinheirinapp/src/models/movimentacao.dart';
import 'package:meudinheirinapp/src/models/movimentacoes.dart';
import 'package:meudinheirinapp/src/models/saldo.dart';
import 'package:provider/provider.dart';

class AddCredit extends StatelessWidget {
  final _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                    'Bora colocar um dinheirinho no bolso :)',
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
            Provider.of<Saldo>(context, listen: false).add(
              double.parse(_inputController.text),
            );
            Provider.of<Movimentacoes>(context, listen: false).add(
              Movimentacao(
                  valor: double.parse(_inputController.text),
                  data: DateTime.now(),
                  tipo: Etipos.entrada),
            );
            Navigator.popAndPushNamed(context, '/dashboard');
          }
        },
        label: const Text('Confirmar'),
      ),
    );
  }
}
