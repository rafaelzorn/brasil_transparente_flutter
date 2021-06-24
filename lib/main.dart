import 'package:flutter/material.dart';

void main() {
  runApp(Main ());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasil Transparente',
      debugShowCheckedModeBanner: false,
      home: Text('App'),
    );
  }
}