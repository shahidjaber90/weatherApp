import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/home_model.dart';
import 'package:weatherapp/Models/hourly_model.dart';


getCurrentWeather(cityName)async{
var url = "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=e372b9a5f4508386f8d8ca998d9ed3d1&units=metric";
  var res = await http.get(Uri.parse(url));
  
    if (res.statusCode == 200){
      var data = homeModelFromJson(res.body.toString());
      print('karachi Weather Data Received');
      return data;
  }
}


getHourlyWeather()async{
var hourlyLink = "https://api.openweathermap.org/data/2.5/forecast?q=karachi&appid=e372b9a5f4508386f8d8ca998d9ed3d1&units=metric";
  var res = await http.get(Uri.parse(hourlyLink));
  
    if (res.statusCode == 200){
      var data = hourlyModelFromJson(res.body.toString());
      print('karachi Hourly Weather Data Received');
      return data;
  }
}