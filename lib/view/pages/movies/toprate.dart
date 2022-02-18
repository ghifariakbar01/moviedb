import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_toprate.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/view/widgets/allcards.dart';
import 'package:shimmer/shimmer.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key, required this.tv}) : super(key: key);
  final bool tv;

  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  int? id;

  @override
  Widget build(BuildContext context) {
    API api = API();

    return !widget.tv
        ? Container(
            height: 103,
            child: FutureBuilder<TopRateMod?>(
              future: API.getTopRated(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TopRateMod topRateMod = snapshot.data!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          children: [
                            ...topRateMod.results!.map((movies) {
                              return AllCards(
                                id: movies?.id,
                                title: movies?.title,
                                image: imageUrl + "${movies?.posterPath}",
                                description: movies?.overview,
                              );
                            }).take(10)
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          )
        : Container(
            height: 103,
            child: FutureBuilder<TVPopular?>(
              future: API.getPopularTv(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TVPopular topRateMod = snapshot.data!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          children: [
                            ...topRateMod.results!.map((movies) {
                              return AllCards(
                                id: movies?.id,
                                title: "${movies?.originalName}",
                                image: imageUrl + "${movies?.posterPath}",
                                description: "${movies?.overview}",
                              );
                            }).take(10)
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              const AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          );
  }
}
