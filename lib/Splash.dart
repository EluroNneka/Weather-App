import 'dart:convert';

import 'package:WeatherApp/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class MyHome extends StatefulWidget {
  static const routeName = '/MyHome';
  final String location;

  const MyHome({Key key, this.location}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<MyHome> {
  var temperature;
  var description;
  var currently;
  var humidity;
  var windspeed;

  Future getWeather() async {
    http.Response response = await http.get(Uri(
        scheme: 'http://api.openweathermap.org',
        path: '/data/2.5/weather',
        query: '?q=${widget.location}&appid=f0e9f28578e640fd16707728164bc55c'));

    var results = jsonDecode(response.body);
    setState(() {
      this.temperature = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      currently != null ? currently.toString() : 'Loading',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Text(
                    temperature != null
                        ? temperature.toString() + '\u00B0'
                        : 'Loading',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        description != null
                            ? description.toString()
                            : 'Loading',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ))
                ])),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: ListView(children: [
              ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text('Temperature'),
                  trailing: Text(temperature != null
                      ? temperature.toString() + '\u00B0'
                      : 'Loading')),
              ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text('Weather'),
                  trailing: Text(description != null
                      ? description.toString()
                      : 'Loading')),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.sun),
                title: Text('Humidity'),
                trailing:
                Text(humidity != null ? humidity.toString() : 'Loading'),
              ),
              ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text('Windspeed'),
                  trailing: Text(
                      windspeed != null ? windspeed.toString() : 'Loading')),
            ]),
          ),
        ),
      ]),
    );
  }
}


