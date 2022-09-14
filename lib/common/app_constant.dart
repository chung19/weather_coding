import 'package:flutter/material.dart';

class AppConstant {
  static const routeHomePage = '/home_page';
  static const routeDetailPage = '/home_page/detail';

  static const baseUrl = 'https://api.openweathermap.org/';
  static const appId = "2206d84c8189efe365465e3318f487aa";
}
 const  kPrimaryColorHome = Color(0xFFffffff);
const  kPrimaryColorMainTemperature = Color(0xFF9d9ab7);
const String city ='' ;
const kPrimaryCityNameTextStyle = TextStyle(
  fontSize: 35,
  // fontWeight: FontWeight.bold,
  color:  kPrimaryColorHome);
const kPrimaryTemperatureTextStyleHome = TextStyle(
  fontSize: 65,
  color: kPrimaryColorHome,
);
const kPrimaryTextTemperatureWeather = TextStyle(
  fontSize: 25,
  color: kPrimaryColorHome,
);
const kPrimaryTextMainTemperature = TextStyle(
  fontSize: 25,
  color: kPrimaryColorMainTemperature,
);
