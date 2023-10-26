import 'package:flutter/material.dart';
import 'package:pokedex/screens/details.dart';
import 'package:pokedex/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedéx',
      theme: ThemeData(primarySwatch: Colors.red),
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
      },
      initialRoute: '/',
    );
  }
}
