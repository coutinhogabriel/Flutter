import 'package:flutter/material.dart';
import 'package:projeto_api_geo/View/favorito_screen.dart';
import 'package:projeto_api_geo/View/historico_screen.dart';
import 'package:projeto_api_geo/View/home_screen.dart';

void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'projeto API GEO',
      home:HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes:{
        '/historico' :(context)=>HistoricoScreen(),
        '/favorito':(context)=>FavoritoScreen(),
      },
    );
  }
}