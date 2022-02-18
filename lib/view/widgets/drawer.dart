import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  _DrawerHomeState createState() => _DrawerHomeState();
}

//make async function to check if user exist

class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: Image.asset('assets/logo.png'),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        )),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            child: Text(
                              "Movie Geek",
                              style: const TextStyle(
                                  fontFamily: "Proppins",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            child: Text(
                              "08123456789",
                              style: const TextStyle(
                                  fontFamily: "Proppins",
                                  fontSize: 9,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: ColorPalette.themeColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Member",
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Proppins",
                              fontSize: 9,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
              child: const ListTile(
                leading: const Icon(
                  Icons.search,
                  color: ColorPalette.themeColor,
                ),
                title: const Text(
                  'Search Movies ',
                  style: TextStyle(
                      fontFamily: "Proppins",
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              }),
        ],
      ),
    );
  }
}
