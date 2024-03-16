import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém informações de tamanho e orientação da tela
    final Size screenSize = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Responsivo com MediaQuery'),
      ),
      body: Center(
        child: Container(
          width: screenSize.width * 0.8, // 80% da largura da tela
          height: screenSize.height * 0.5, // 50% da altura da tela
          color: Colors.blue,
          child: Center(
            child: Text(
              'Tamanho da tela: ${screenSize.width.round()} x ${screenSize.height.round()}\nOrientação: ${orientation == Orientation.portrait ? 'Retrato' : 'Paisagem'}',
              style: TextStyle(
                fontSize: orientation == Orientation.portrait
                    ? 24
                    : 18, // Define o tamanho da fonte com base na orientação
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
