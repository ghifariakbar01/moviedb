import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/view/widgets/detailinfo.dart';

class AllCards extends StatelessWidget {
  const AllCards(
      {Key? key,
      required this.image,
      required this.description,
      required this.title,
      required this.id})
      : super(key: key);
  final int? id;
  final String? image;
  final String? description;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      child: OpenContainer(
        openBuilder: (context, action) => DetailInfoPage(
          title: title,
          content: description,
          imageUrl: image,
          date: DateTime.now(),
          url: image!,
        ),
        closedElevation: 0,
        closedBuilder: (context, action) => Container(
          width: 150,
          margin: const EdgeInsets.only(left: 8, right: 8, top: 5),
          decoration: BoxDecoration(
            //cached network image
            image: DecorationImage(
              image: CachedNetworkImageProvider(image!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              //crreate title text
              Container(
                height: 10,
                margin: EdgeInsets.only(top: 10, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        title!,
                        maxLines: 3,
                        style: TextStyle(
                            fontFamily: "Proppins",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      description!.substring(0, 15) + "...",
                      maxLines: 5,
                      style: TextStyle(
                          fontFamily: "Proppins",
                          fontSize: 11,
                          fontWeight: FontWeight.w100,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 70,
                    child: Center(
                      child: Text(
                        "Detail",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 10, left: 16, right: 10),
                    decoration: BoxDecoration(
                        color: ColorPalette.textColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
