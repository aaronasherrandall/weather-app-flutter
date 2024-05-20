import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  // api key
  final _weatherService = WeatherService('e325ff9a01d5dd59702e888cbafe946f');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get current city
    String cityName = await _weatherService.getCurrentCity();

    // get the weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    // error handling
    catch (e) {
      print(e);
    }
  }

  // weather animations

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loading city..."),

            //temperature
            Text('${_weather?.temperature.round()}°C')
          ],),
      )
    );
  }
}
