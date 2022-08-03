// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:delos_weather_app/components/weather.dart';
import 'package:delos_weather_app/controllers/weather_controller.dart';
import 'package:delos_weather_app/models/weather.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Weather>? _weathers;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeatherList();
  }

  Future<void> getWeatherList() async {
    setState(() {
      _isLoading = true;
    });
    _weathers = await WeatherController.getWeatherList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text("Weather App")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: getWeatherList,
                child: ListView.separated(
                  itemCount: _weathers!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(height: 2),
                  itemBuilder: (context, index) {
                    return WeatherWidget(weather: _weathers![index]);
                  }
                )
              )
      )
    );
  }
}
