import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; // Location name for ui

  String time; // Time in that Location

  String flag; // url to flag asset

  String url; // Location to append to time api url

  bool isDaytime;

  // Create constructors
  WorldTime({
    this.location,
    this.flag,
    this.url,
  });


  Future<void> getTime() async {

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      print(data);

      //Get properties from data
      //
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // Create a datetime Object

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset))); // Add amount of time/duration

      isDaytime =  now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);

    }catch(e){

      print('Error: $e');

      time = 'Could not get time data';
    }

  }

}



