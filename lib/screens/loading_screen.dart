import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/utils/constants.dart';
import '/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.lattitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(Uri.parse(
        'api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kAPIKey'));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
