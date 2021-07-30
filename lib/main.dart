import 'package:WeatherApp/Splash.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
      MaterialApp(
    title: 'Weather App',
    home:
  Welcome()
  ));
}

class Welcome extends StatelessWidget {
static String location;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
          backgroundColor: Colors.purpleAccent,
          //
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(' Welcome to My Weather App',
              style: TextStyle(color: Colors.black, fontSize: 14, ),),
            Center(
             // width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width-150,
                    child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.black, fontSize: 14, ),
                        onChanged: (value) {
                          location = value;
                        },
                      decoration: InputDecoration(
                        hintText: 'Enter your country',
                        isDense:  true,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white38,

                      ),
                      ),
                  ),
                    //Spacer(),
                    IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {
                      MaterialPageRoute(builder: (BuildContext context) {
                         return MyHome(location: location);
                      }, settings: RouteSettings(name: MyHome.routeName, arguments: location ));
                    }
    ),
                  ],
                ),
            ),
          ],
        ),
      ),



    );

  }
}

