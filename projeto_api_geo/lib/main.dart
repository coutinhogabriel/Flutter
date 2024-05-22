import 'package:flutter/material.dart';
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
        
      },
    );
  }
}