// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '/utils/constants.dart';
import '/services/weather.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String weatherIcon = 'NA';
  String? cityName;
  String? message;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.round();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      message = weather.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/location_bg.jpg'),
          fit: BoxFit.cover,
        )),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.near_me_rounded,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.location_city_rounded,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherIcon,
                        style: kConditionTextStyle,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    "$message $cityName",
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
