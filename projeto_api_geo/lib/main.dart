import 'package:flutter/material.dart';
import 'package:projeto_api_geo/View/search_screen.dart';
import 'package:projeto_api_geo/View/favorites_screen.dart'; 
import 'package:projeto_api_geo/View/details_weather_screen.dart';
import 'package:projeto_api_geo/View/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project API GEO",
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/search': (context) => const SearchScreen(),
        '/favorites': (context) => FavoritesScreen(), 
      },
    );
  }
}
