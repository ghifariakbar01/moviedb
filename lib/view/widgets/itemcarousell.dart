import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Item1 extends StatelessWidget {
  Item1(
      {Key? key,
      required this.urlToImage,
      required this.title,
      required this.desc,
      required this.url,
      required this.released})
      : super(key: key);
  final String urlToImage;
  final String title, desc, url;
  final DateTime released;
  get geturlToImage => urlToImage;
  get getTitle => title;
  get getDesc => desc;
  get getUrl => url;
  get getReleased => released;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: CachedNetworkImage(
        height:
            //convert 200 to height of the screen
            MediaQuery.of(context).size.height * 0.2,
        imageUrl:
            // 'https://jalindesaapi.connexist.com' +
            urlToImage,
        fit: BoxFit.fitWidth,
        errorWidget: (context, url, error) => Center(
            child: Image.asset(
          "assets/default_image.png",
          fit: BoxFit.fitWidth,
        )),
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
