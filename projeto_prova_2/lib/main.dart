import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart'; // Importa a página inicial

void main() async {
  // Inicializa o Hive
  await Hive.initFlutter();
  await Hive.openBox('animeBox'); // Abre o box de animes

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Define a página inicial
    );
  }
}

