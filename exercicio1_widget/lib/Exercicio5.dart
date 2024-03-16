import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // Barra de navegação superior
        appBar: AppBar(
          title: Text("Formulário de Contato"),
        ),
        // Corpo do aplicativo
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            // Widget Form para criar um formulário
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Coluna para organizar os elementos verticalmente
              children: [
                // Campo de texto para o nome
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome', // Rótulo do campo
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os campos
                // Campo de texto para o e-mail
                TextFormField(
                  keyboardType: TextInputType.emailAddress, // Tipo de teclado para e-mail
                  decoration: InputDecoration(
                    labelText: 'E-mail', // Rótulo do campo
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os campos
                // Campo de texto para o telefone
                TextFormField(
                  keyboardType: TextInputType.phone, // Tipo de teclado para telefone
                  decoration: InputDecoration(
                    labelText: 'Telefone', // Rótulo do campo
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os campos
                // Campo de texto para o endereço
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Endereço', // Rótulo do campo
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os campos
                // Campo de texto para a mensagem
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mensagem', // Rótulo do campo
                  ),
                ),
                SizedBox(height: 20), // Espaçamento entre os campos
                // Botão para enviar o formulário
                ElevatedButton(
                  onPressed: () {
                    // Lógica para enviar o formulário aqui
                  },
                  child: Text('Enviar'), // Texto do botão
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
