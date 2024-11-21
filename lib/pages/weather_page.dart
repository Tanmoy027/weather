import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherPage();
}

class _WeatherPage extends State<Weatherpage> {
//api key
  final _weatherservice =
      WeatherService('582cb745d276c65e8de061e982987322987322');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
// get the current city
    String cityname = await _weatherservice.getCurrentCity();

    // get weather for city
    try {
      final Weather = await _weatherservice.getWeather(cityname);
      setState(() {
        _weather = Weather;
      });
    }

    // any error
    catch (e) {
      print(e);
    }
  }

  // weather animation

  // init state
  @override
  void initState() {
    super.initState();

    //fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // City name
            Text(_weather?.cityname ?? "Loading city..."),

            // Temperature
            Text(
              _weather != null
                  ? '${_weather!.temperature.round()}°C'
                  : "Loading temperature...",
            ),
          ],
        ),
      ),
    );
  }
}
