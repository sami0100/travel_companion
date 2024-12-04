import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = 'a74f69dc0f56df8b0e7eaa2440c8b8b5';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Function to fetch weather by city name
  Future<Map<String, dynamic>> getWeather(String cityName) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
