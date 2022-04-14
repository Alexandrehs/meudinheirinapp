import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meudinheirinapp/src/models/movimentacoes.dart';
import 'package:meudinheirinapp/src/models/saldo.dart';
import 'package:meudinheirinapp/src/pages/add_credit.dart';
import 'package:meudinheirinapp/src/pages/dashboard.dart';
import 'package:meudinheirinapp/src/pages/remove_credit.dart';
import 'package:meudinheirinapp/src/pages/select_operation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Saldo(),
        ),
        ChangeNotifierProvider(
          create: (context) => Movimentacoes(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Meu Dinheirin App',
            theme: ThemeData.light(),
            routes: {
              '/dashboard': (context) => Dashboard(),
              '/selectOperation': (context) => SelectOperation(),
              '/addCredit': (context) => AddCredit(),
              '/removeCredit': (context) => RemoveCredit(),
            },
            initialRoute: '/dashboard',
          );
        }
        return Container(
          color: Colors.white,
        );
      },
    );
  }
}
