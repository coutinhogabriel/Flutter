import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'register_page.dart'; // Importe a RegisterPage

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page', // Define o título da aplicação
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define a cor primária da aplicação
      ),
      home: LoginScreen(), // Define a página inicial como LoginScreen
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState(); // Cria o estado da tela de login
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(); // Controlador para o campo de e-mail
  final TextEditingController _passwordController = TextEditingController(); // Controlador para o campo de senha

  late Database _database; // Variável para armazenar o banco de dados

  @override
  void initState() {
    super.initState();
    _initDatabase(); // Inicializa o banco de dados quando a tela é criada
  }

  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath(); // Obtém o diretório onde o banco de dados será armazenado
    final path = join(databasesPath, 'users.db'); // Define o caminho do banco de dados

    // Abre o banco de dados ou cria um novo se não existir
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Cria a tabela de usuários se não existir
        await db.execute(
          'CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT)',
        );
      },
    );
  }

  Future<void> _loginUser() async {
    final email = _emailController.text; // Obtém o e-mail inserido pelo usuário
    final password = _passwordController.text; // Obtém a senha inserida pelo usuário

    // Consulta o banco de dados para o usuário com o e-mail e senha fornecidos
    final List<Map<String, dynamic>> user = await _database.rawQuery(
      'SELECT * FROM Users WHERE email = ? AND password = ?',
      [email, password],
    );

    if (user.isNotEmpty) {
      // Se um usuário com as credenciais fornecidas for encontrado, faça algo, como navegar para outra página
      print('Usuário autenticado: $user');
    } else {
      // Se não houver usuário encontrado com as credenciais fornecidas, exiba uma mensagem de erro
      print('Credenciais inválidas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'), // Define o título da barra de navegação como "Login"
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email', // Define o rótulo do campo como "Email"
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password', // Define o rótulo do campo como "Password"
              ),
              obscureText: true, // Esconde o texto digitado no campo de senha
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _loginUser(); // Chama o método para fazer login do usuário
              },
              child: Text('Login'), // Define o texto do botão como "Login"
            ),
            SizedBox(height: 10.0),
            // TextButton(
            //   onPressed: () {
            //     // Navegue para a página de registro ao pressionar o botão "Não tem uma conta? Cadastre-se aqui"
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => RegisterPage()),
            //     );
            //   },
            //   child: Text('Não tem uma conta? Cadastre-se aqui'), // Define o texto do botão como "Não tem uma conta? Cadastre-se aqui"
            // ),
          ],
        ),
      ),
    );
  }
}