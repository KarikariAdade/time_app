import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Map is like an object
  Map data = {

  };

  @override
  Widget build(BuildContext context) {


    //Modal route to get content of route data

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // Set background

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';

    Color textColor = data['isDaytime'] ? Colors.black : Colors.white;

    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[900];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 10.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'location': result['location'],
                          'time': result['time'],
                          'flag': result['flag'],
                          'isDaytime': result['isDaytime'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: textColor),
                    label: Text('Edit Location', style: TextStyle(color: textColor))
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: textColor
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: textColor,
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
