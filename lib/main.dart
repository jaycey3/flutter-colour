import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/match.dart';

void main() {
  runApp(Colours());
}

class Colours extends StatelessWidget {
  const Colours({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'What\'s your Colour?',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/match': (context) => Match(),
      },
    );
  }
}