import 'package:flutter/material.dart';
import 'package:omdb/view/pages/carousell.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/color_pallete.dart';
import 'api.helper.dart';
import '../view/widgets/home.dart';

class Root extends StatefulWidget {
  @override
  RootState createState() => RootState();
}

class RootState extends State<Root> {
  bool isHomeLoading = true;
  bool goingHome = true;

  Widget buildProgressIndicator() {
    return Scaffold(
      backgroundColor: ColorPalette.bgColor,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  //get shared prefs visited
  Future<bool> getVisited() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('visited') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    getVisited().then((value) => !value
        ? Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CarousellPage()))
        : Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeWidget(
                      title: 'Elemes Movie',
                    ))));

    return buildProgressIndicator();
  }
}
