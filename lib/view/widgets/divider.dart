import 'package:flutter/material.dart';
import '../../constant/color_pallete.dart';

Widget divider(String title, String route, bool isRoute, BuildContext context) {
  return isRoute == true
      ? Container(
          margin: EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              InkWell(
                onTap: () {
                  //Navigate to donasi
                  Navigator.pushNamed(context, route);
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lihat Semua",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      : Container(
          margin: EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        );
}
