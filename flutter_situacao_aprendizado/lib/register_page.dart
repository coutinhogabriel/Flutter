import 'package:flutter/material.dart';
import 'banco_de_dados.dart';

class PaginaCadastro extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            TextField(
              controller:idController,
              decoration: InputDecoration(labelText: 'Id'),
            ),
            ElevatedButton(
              child: Text('Cadastrar'),
              onPressed: () {
                final String email = emailController.text;
                final String senha = senhaController.text;
                final int id = idController.text as int;

                final Usuario novoUsuario = Usuario(email: email, senha: senha, id: id);
                BancoDeDados.inserirUsuario(novoUsuario);
              },
            ),
          ],
        ),
      ),
    );
  }
}
