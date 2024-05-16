import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo/Service/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> _weatherData = {};
  WeatherService _weatherService = new WeatherService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _getWeatherInit() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      print(position.latitude);
      _weatherData = await _weatherService.getWeatherByLocation(
          position.latitude, position.longitude);
      print("Localização na bala");
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previsão do tempo'),
        //adicionar icone para procurar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Pesquisar")),
                ElevatedButton(onPressed: () {}, child: Text("Favorito"))
              ],
            ),
            const SizedBox(height: 20),
            _weatherData.isEmpty
                ? Row(
                    children: [
                      Text("Erro de Conexão"),
                      IconButton(icon: Icon(Icons.refresh), onPressed: () {})
                    ],
                  )
                : Column(
                    children: [
                      Text(_weatherData["name"]),
                      Text(_weatherData["weather"][0]["description"]),
                      Text(_weatherData["weather"][0]["main"]),
                      Text(_weatherData["main"]["temp"].toString()),
                      Text(_weatherData["main"]["temp_min"].toString()),
                      Text(_weatherData["main"]["temp_max"].toString()),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
