import 'package:drower/data/weather.dart';
import 'package:flutter/material.dart';
import '../data/http_helper.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Weather result=Weather('','',0,0,0,0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather')),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('get Data'),
            onPressed: getData,
          ),
          Text(result.name),
        ]
      ),
    );

  }
  Future getData()async{
    HttpHelper helper =HttpHelper();
    result =await helper.getWeather('London');
    setState(() {

    });
  }
}
