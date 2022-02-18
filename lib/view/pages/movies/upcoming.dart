import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_upcoming.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';
import 'package:omdb/utils/api.helper.dart';
import 'package:omdb/utils/helper.dart';
import 'package:omdb/view/widgets/allcards.dart';
import 'package:shimmer/shimmer.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key, required this.tv}) : super(key: key);
  final bool tv;
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    API api = API();

    return !widget.tv
        ? Container(
            height: 100,
            child: FutureBuilder<UpcomingMod?>(
              future: API.getUpcoming(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  UpcomingMod upcomingMod = snapshot.data!;
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          children: [
                            ...upcomingMod.results.map((movies) {
                              return AllCards(
                                id: movies.id,
                                title: movies.title,
                                image: imageUrl + movies.posterPath,
                                description: ConnexistHelper.formatDate(
                                    movies.releaseDate),
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
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: [
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
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
        : SizedBox(
            height: 100,
            child: FutureBuilder<TVPopular?>(
              future: API.getTvOnTheAir(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TVPopular upcomingMod = snapshot.data!;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Row(
                        children: [
                          ...upcomingMod.results!
                              .map((movies) {
                                return AllCards(
                                  id: movies?.id,
                                  title: movies?.originalName,
                                  image: imageUrl + "${movies?.posterPath}",
                                  description: movies?.overview,
                                );
                              })
                              .take(3)
                              .toList()
                        ],
                      ),
                    ),
                  );
                } else {
                  return Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: [
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
                                id: 1,
                                title: "Dummy",
                                image: "Dummy",
                                description: "Dummy",
                              ),
                              AllCards(
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
