import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/Service/city_db_service.dart';
import 'package:projeto_api_geo/Service/favorites_service.dart';
import 'package:weather_icons/weather_icons.dart'; // Importando ícones de clima

import '../Model/city_model.dart';

class DetailsWeatherScreen extends StatefulWidget {
  final String city;
  const DetailsWeatherScreen({Key? key, required this.city}) : super(key: key);

  @override
  State<DetailsWeatherScreen> createState() => _DetailsWeatherScreenState();
}

class _DetailsWeatherScreenState extends State<DetailsWeatherScreen> {
  final WeatherController _controller = WeatherController();
  final CityDataBaseService _dbService = CityDataBaseService();
  final FavoritesService _favoritesService = FavoritesService();

  // Traduções dos tipos de clima
  final Map<String, String> weatherTranslations = {
    "clear sky": "Céu limpo",
    "few clouds": "Poucas nuvens",
    "scattered clouds": "Nuvens dispersas",
    "broken clouds": "Nuvens quebradas",
    "shower rain": "Chuva de banho",
    "rain": "Chuva",
    "thunderstorm": "Trovoada",
    "snow": "Neve",
    "mist": "Névoa"
  };

  // Cores de fundo para cada tipo de clima
  final Map<String, Color> weatherBackgroundColors = {
    "clear sky": Color.fromARGB(255, 208, 248, 98),
    "few clouds": Colors.lightBlueAccent,
    "scattered clouds": Color.fromARGB(255, 247, 250, 252),
    "broken clouds": const Color.fromARGB(255, 3, 3, 3),
    "shower rain": Colors.indigo,
    "rain": Color.fromARGB(255, 27, 2, 245),
    "thunderstorm": const Color.fromARGB(255, 183, 154, 233),
    "snow": Colors.white,
    "mist": const Color.fromARGB(255, 52, 66, 73)!,
  };

  // Função para traduzir descrição do clima
  String translateWeather(String description) {
    return weatherTranslations[description.toLowerCase()] ?? description;
  }

  // Função para obter o ícone correspondente ao tipo de clima
  IconData getWeatherIcon(String description) {
    switch (description.toLowerCase()) {
      case 'clear sky':
        return WeatherIcons.day_sunny;
      case 'few clouds':
        return WeatherIcons.day_cloudy;
      case 'scattered clouds':
      case 'broken clouds':
        return WeatherIcons.cloud;
      case 'shower rain':
        return WeatherIcons.showers;
      case 'rain':
        return WeatherIcons.rain;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'snow':
        return WeatherIcons.snow;
      case 'mist':
        return WeatherIcons.fog;
      default:
        return WeatherIcons.day_sunny; // Ícone padrão para descrições não reconhecidas
    }
  }

  // Função para obter a cor de fundo correspondente ao tipo de clima
  Color getBackgroundColor(String description) {
    return weatherBackgroundColors[description.toLowerCase()] ?? Colors.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Tempo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: FutureBuilder(
            future: _controller.getWeather(widget.city), // Obtém dados meteorológicos para a cidade selecionada
            builder: (context, snapshot) {
              if (_controller.weatherList.isEmpty) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                );
              } else {
                final weather = _controller.weatherList.last; // Último dado meteorológico obtido
                final backgroundColor = getBackgroundColor(weather.description); // Cor de fundo com base no clima

                return Container(
                  color: backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weather.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite), // Ícone de favorito
                            onPressed: () async {
                              final city = City(cityName: weather.name, favoriteCities: 1); // Cria objeto City para adicionar aos favoritos
                              await _favoritesService.addFavorite(city); // Adiciona a cidade aos favoritos
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${weather.name} foi adicionado aos favoritos.'),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      Icon(
                        getWeatherIcon(weather.description), // Ícone correspondente ao clima
                        size: 100.0,
                        color: Colors.white,
                      ),
                      Text(
                        translateWeather(weather.description), // Tradução do tipo de clima
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Temperatura: ${(weather.temp - 273).toStringAsFixed(2)}°C', // Temperatura formatada
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
