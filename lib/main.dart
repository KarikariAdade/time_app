import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/', // Sets the default route, this overides the  routes object
  // Routes for the project
  routes: {
    '/': (context) => Loading(), // Base route
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation()
  },
));