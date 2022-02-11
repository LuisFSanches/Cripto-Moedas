import 'package:cripto_moedas/repositories/favoritas_repository.dart';
import 'package:cripto_moedas/views/home_page.dart';
import 'package:cripto_moedas/views/moedas_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     ChangeNotifierProvider(create: (context) => FavoritasRepository(),
      child: const MyApp(),
     )
     );
   
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage()
    );
  }
}

