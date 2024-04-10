import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite'),
      ),
      body: Center(
        child: Text('BEM VINDO A PÁGINA INICIAL'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Login',
    initialRoute: '/',
    routes: {
      '/home': (context) => HomePage(),
    },
  ));
}