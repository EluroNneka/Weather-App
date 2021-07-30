import 'package:weather_app/Splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: Welcome()));
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String location;
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      //
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to My Weather App',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Input a country to see the current weather there',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              // width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width - 150,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      onChanged: (value) {
                        location = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your country',
                        isDense: true,
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white38,
                      ),
                    ),
                  ),
                  //Spacer(),
                  IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return MyHome(location: location);
                          },
                        ));
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
