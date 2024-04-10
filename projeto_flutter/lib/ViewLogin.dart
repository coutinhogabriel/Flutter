import 'package:flutter/material.dart';
import 'package:projeto_flutter/ViewHomePage.dart';
import 'ViewCadastro.dart'; // Importa a tela de cadastro
import 'BancoDadosCrud.dart'; // Importa a classe BancoDadosCrud
import 'Model.dart'; // Importa o modelo de usuário

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAÇA SEU LOGIN'),
        backgroundColor: Color.fromARGB(255, 181, 234, 243),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'POR FAVOR, DIGITE O USUÁRIO';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'POR FAVOR, DIGITE A SENHA';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                // Validar os campos do formulário

                String email = _usernameController.text;
                String senha = _passwordController.text;

                // Verificar se o usuário com o e-mail fornecido está cadastrado
                if (await BancoDadosCrud()
                    .checkUserByEmailExists(email, senha)) {
                  print('deu boa');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ); // Navega para a tela de cadastro
                  // Usuário com o e-mail fornecido está cadastrado

                  // Verificar a senha
                  // bool senhaCorreta = await BancoDadosCrud().checkUserPassword(senha);

                  // if (senhaCorreta) {
                  //   // Senha correta, faça login
                  //   // Navegue para a tela inicial ou execute a lógica necessária
                  //   Navigator.pushNamed(context, '/cadastrado');
                  // } else {
                  //   // Senha incorreta, exiba uma mensagem de erro
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         title: Text('Erro de login'),
                  //         content: Text('SENHA INCORRETA'),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //             child: Text('OK'),
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // }
                } else {
                  // Usuário não encontrado
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro de login'),
                        content: Text('USUÁRIO NÃO CADASTRADO'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
            child: Text('Login'),
          ),
          SizedBox(height: 8.0),
          Text(
            "CRIAR CADASTRO",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {
              // Navega para a tela de cadastro ao pressionar o botão "Cadastre-se"
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CadastroView()), // Navega para a tela de cadastro
              );
            },
            child: Text('Cadastre-se'),
          ),
        ],
      ),
    );
  }
}
