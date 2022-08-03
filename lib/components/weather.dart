// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace,prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors
import 'package:delos_weather_app/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget(
      {required this.weather});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {                          
        Get.toNamed('/detail', arguments: weather
      );
      },                      
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(weather.icon),
              width: 50,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEE, MMM dd, yyyy HH:mm a').format(DateTime.fromMillisecondsSinceEpoch(weather.timeStamp* 1000)).toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(weather.title, style: TextStyle(color: Colors.black, fontSize: 15),),
                    SizedBox(height: 5),
                    Text("Temp: "+weather.temp.toStringAsFixed(1)+ "°C", style: TextStyle(color: Colors.black54)),
                    Divider(color: Colors.black38,)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
