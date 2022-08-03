// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Weather Details"),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                DateFormat('EEE, MMM dd, yyyy')
                    .format(DateTime.fromMillisecondsSinceEpoch(
                        weather.timeStamp * 1000))
                    .toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                DateFormat('HH:mm a')
                    .format(DateTime.fromMillisecondsSinceEpoch(
                        weather.timeStamp * 1000))
                    .toString(),
                style: TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    weather.temp.toStringAsFixed(1) + "°C",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                  Image(
                      image: NetworkImage(weather.icon),
                      width: 150,
                      fit: BoxFit.cover)
                ],
              ),
              Text(
                weather.title + " (" + weather.description + ")",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Text("Temp (min)"),
                    SizedBox(height: 10),
                    Text(
                      weather.temp_min.toStringAsFixed(1) + "°C",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                  SizedBox(width: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text("Temp (max)"),
                    SizedBox(height: 10),
                    Text(
                      weather.temp_max.toStringAsFixed(1) + "°C",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
