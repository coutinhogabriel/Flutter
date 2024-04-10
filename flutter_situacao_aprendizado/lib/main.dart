import 'package:flutter/material.dart';
import 'login_page.dart'; // Importe a LoginPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Defina a rota inicial como LoginPage
      initialRoute: '/login',
      // Defina as rotas da aplicação
      routes: {
        '/login': (context) => LoginPage(), // Defina a rota para a LoginPage
      },
    );
  }
}