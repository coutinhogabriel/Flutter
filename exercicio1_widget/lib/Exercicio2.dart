import 'package:exercicio1_widget/Exercicio1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text("Exercicio2")) ,
        body: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Column(
              children: [
                 Text('Texto da Primeira Coluna'),
                  SizedBox(height: 10), // Espaçamento entre o texto e o ícone
                  Icon(Icons.phone_android), // Ícone embaixo do texto
                  SizedBox(height: 10), // Espaçamento entre o ícone e o texto
                  Icon( Icons.phone_android, color: Colors.red,
                  )
              ],
            ),
            Column(
              children: [
                Text('Texto da Segunda Coluna'),
                SizedBox(height: 10), // Espaçamento entre o ícone e o texto
                  Icon(Icons.e_mobiledata, color: Colors.red),
                    SizedBox(height: 10), // Espaçamento entre o ícone e o texto
                  Icon(Icons.abc_sharp, color: Colors.black,
                  )
              ],
            ),
            Column(
              children: [
                Text('Texto da Terceira Coluna'),
                SizedBox(height: 10), // Espaçamento entre o ícone e o texto
                Icon(Icons.bluetooth, color: Colors.blue),
                SizedBox(height: 10), // Espaçamento entre o ícone e o texto
                Icon(Icons.radio, color: Colors.blue),
              ],

            ),
          ],),
        )),
    );
  }  
}

