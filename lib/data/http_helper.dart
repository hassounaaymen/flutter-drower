import 'package:drower/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper{
 // https://api.openweathermap.org/data/2.5/
  // weather?q=London&appid=b47e8f62aa33a24ab0fe0ab55be16f90
  final String authority ='api.openweathermap.org';
  final String path ='data/2.5/weather';
  final String apiKey ='b47e8f62aa33a24ab0fe0ab55be16f90';

  Future<Weather> getWeather(String location) async{
  Map<String, dynamic> parameters={'q':location,'appId':apiKey};
  Uri uri =Uri.https(authority,path,parameters);
  http.Response result = await http.get(uri);
  Map<String,dynamic>data =json.decode(result.body);
  Weather weather =Weather.fromJson(data);

    return weather;
  }
}