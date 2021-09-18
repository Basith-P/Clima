import 'package:flutter/material.dart';

import '/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print('langitude = ${location.lattitude}');
    print('longitude = ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}