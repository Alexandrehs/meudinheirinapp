import 'package:flutter/material.dart';

class SelectOperation extends StatelessWidget {
  final List<String> _list = ['Saída', 'Entrada'];
  final List<int> _colors = [500, 600, 700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.arrow_circle_up_outlined,
              color: Colors.green[500],
              size: 40,
            ),
            title: const Text('Adicionar'),
            onTap: () {
              Navigator.pushNamed(context, '/addCredit');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_circle_down_outlined,
              color: Colors.red[500],
              size: 40,
            ),
            title: const Text('Remover'),
            onTap: () {
              Navigator.pushNamed(context, '/removeCredit');
            },
          ),
        ],
      ),
    );
  }
}
