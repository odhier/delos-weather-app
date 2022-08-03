// ignore_for_file: prefer_const_constructors

import 'package:delos_weather_app/pages/detail_page.dart';
import 'package:delos_weather_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    locale: Get.deviceLocale,
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => HomePage(),
      ),
      GetPage(
        name: '/detail',
        page: () => DetailPage(),
        transition: Transition.cupertinoDialog,
      )
    ],
  ));
}
