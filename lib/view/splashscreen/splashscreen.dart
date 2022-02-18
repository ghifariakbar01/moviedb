import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  startTime() async {
    Duration duration = Duration(seconds: 1);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/MyApp');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: ColorPalette.themeColor,
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/logo.png",
                    width: 200,
                    height: 200,
                  ),
                ),
                Container(
                  child: Text(
                    "",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: ColorPalette.textColor),
                  ),
                ),
                //logo image
              ]),
        ),
      ),
    );
  }
}
