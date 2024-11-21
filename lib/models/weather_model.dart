class Weather {
  final String cityname;
  final double temperature;
  final String maincondition;

  Weather({
    required this.cityname,
    required this.maincondition,
    required this.temperature,
  });

  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(
      cityname: json['name'],
      maincondition: json['weather'][0]['main'],
      temperature: json['main']['temp'].toDouble(),
    );
  }
}
