import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delos_weather_app/env.dart';
import 'package:get/get.dart';
import 'package:delos_weather_app/models/weather.dart';
final env = Env();
final baseUrl = env.baseUrl;

class WeatherController extends GetxController{
  static Future<List<Weather>> getWeatherList() async {
    List _temp = [];
    var uri = Uri.https(baseUrl, '/data/2.5/forecast', {
      "lat": env.lat,
      "lon": env.lon,
      "units": "metric",
      "appid": env.apiKey
    });
    try{
      final response = await http.get(uri);

      Map data = jsonDecode(response.body);
      
      for(var i in data['list']){
        _temp.add(i);
      }
    } catch(error){
      // print(error);
    }
    return Weather.weatherFromSnapshot(_temp);
  }
}