import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List <WorldTime> locations = [
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();

    //navigate to home screen and pass the time data we get from the gettime function

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  // print(locations[index].location);
                  updateTime(index);
                },
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
                title: Text(locations[index].location),
              ),
            );
          }
      ),
    );
  }
}
