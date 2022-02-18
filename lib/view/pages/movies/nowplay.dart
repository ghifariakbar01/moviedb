// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_upcoming.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/view/widgets/detailinfo.dart';
import 'package:omdb/view/widgets/itemcarousell.dart';
import 'package:shimmer/shimmer.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key, required this.tv}) : super(key: key);
  final bool tv;
  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  int _currentIndex = 0;
  List cardList = [];
  List tempCard = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  late Future<UpcomingMod?> futures;

  void addList() async {
    futures = API.getNowPlaying();
    await futures.then((value) => value?.results.forEach((element) {
          cardList.add(Item1(
            url: imageUrl + element.posterPath,
            title: element.title,
            desc: element.overview,
            urlToImage: imageUrl + element.posterPath,
            released: element.releaseDate,
          ));
        }));
  }

  late Future<TVPopular?> futures1;

  //addListTv
  void addListTv() async {
    futures1 = API.getNowPlayingTv();
    await futures1.then((value) => value?.results?.forEach((element) {
          cardList.add(Item1(
            url: imageUrl + "${element?.posterPath}",
            title: "${element?.originalName}",
            desc: "${element?.overview}",
            urlToImage: imageUrl + "${element?.posterPath}",
            released: DateTime.now(),
          ));
        }));
  }

  @override
  void initState() {
    super.initState();
    !widget.tv ? addList() : addListTv();
  }

  @override
  Widget build(BuildContext context) {
    return !widget.tv
        ? FutureBuilder<UpcomingMod?>(
            future: futures,
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return OpenContainer(
                    openBuilder: (BuildContext context, _) {
                      return DetailInfoPage(
                        url: cardList[_currentIndex].getUrl,
                        title: cardList[_currentIndex].getTitle,
                        content: cardList[_currentIndex].getDesc,
                        imageUrl: cardList[_currentIndex].geturlToImage,
                        date: cardList[_currentIndex].getReleased,
                      );
                    },
                    closedElevation: 0,
                    closedColor: Colors.white,
                    closedBuilder: (context, action) => InkWell(
                          onTap: action,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                height:
                                    //convert 300 to height of screen
                                    MediaQuery.of(context).size.height * 0.3,
                                margin: const EdgeInsets.only(top: 10),
                                child: CarouselSlider(
                                  items: cardList
                                      .map((card) {
                                        return Builder(
                                            builder: (BuildContext context) {
                                          return Container(
                                            child: card,
                                          );
                                        });
                                      })
                                      .take(10)
                                      .toList(),
                                  options: CarouselOptions(
                                    aspectRatio: 2.0,
                                    viewportFraction: 0.85,
                                    initialPage: 1,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    // aspectRatio: 2.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: map<Widget>(
                                  cardList,
                                  (index, url) {
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _currentIndex == index
                                            ? ColorPalette.textColor
                                                .withOpacity(0.8)
                                            : ColorPalette.textColor
                                                .withOpacity(0.4),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                enabled: true,
                child: Container(
                  //rounded corners
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(10),
                  height: 150,
                  child: Card(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            })
        : FutureBuilder<TVPopular?>(
            future: futures1,
            // ignore: missing_return
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return OpenContainer(
                    openBuilder: (BuildContext context, _) {
                      return DetailInfoPage(
                        url: cardList[_currentIndex].getUrl,
                        title: cardList[_currentIndex].getTitle,
                        content: cardList[_currentIndex].getDesc,
                        imageUrl: cardList[_currentIndex].geturlToImage,
                        date: cardList[_currentIndex].getReleased,
                      );
                    },
                    closedElevation: 0,
                    closedColor: Colors.white,
                    closedBuilder: (context, action) => InkWell(
                          onTap: action,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                height:
                                    //convert 300 to height of screen
                                    MediaQuery.of(context).size.height * 0.3,
                                margin: const EdgeInsets.only(top: 10),
                                child: CarouselSlider(
                                  items: cardList
                                      .map((card) {
                                        return Builder(
                                            builder: (BuildContext context) {
                                          return Container(
                                            child: card,
                                          );
                                        });
                                      })
                                      .take(10)
                                      .toList(),
                                  options: CarouselOptions(
                                    aspectRatio: 2.0,
                                    viewportFraction: 0.85,
                                    initialPage: 1,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    enlargeCenterPage: true,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    // aspectRatio: 2.0,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    },
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                enabled: true,
                child: Container(
                  //rounded corners
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.all(10),
                  height: 150,
                  child: Card(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            });
  }
}
