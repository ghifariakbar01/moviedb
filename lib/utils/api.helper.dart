import 'package:dio/dio.dart';
import 'package:omdb/constant/constants.dart';
import 'package:omdb/model/mod_popular.dart';
import 'package:omdb/model/mod_toprate.dart';
import 'package:omdb/model/mod_upcoming.dart';
import 'package:omdb/model/search_mod.dart';
import 'package:omdb/model/tv/tv_mod_popular.dart';

class API {
  //get top rated
  static Future<TopRateMod?> getTopRated() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/movie/top_rated?api_key=$apiKey&language=en-US&page=1');

      TopRateMod topRateMod = TopRateMod.fromJson(response.data);
      print("top rate is ${topRateMod.toJson()}");
      return topRateMod;
    } catch (err) {
      print("error is $err");
      return null;
    }
  }

  //get upcoming
  static Future<UpcomingMod?> getUpcoming() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/movie/upcoming?api_key=$apiKey&language=en-US&page=1');

      UpcomingMod upcomingMod = UpcomingMod.fromJson(response.data);
      return upcomingMod;
    } catch (err) {
      print(err);
      return null;
    }
  }

  // now playing
  static Future<UpcomingMod?> getNowPlaying() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/movie/now_playing?api_key=$apiKey&language=en-US&page=1');

      UpcomingMod nowPlayingMod = UpcomingMod.fromJson(response.data);
      return nowPlayingMod;
    } catch (err) {
      print(err);
      return null;
    }
  }

  //get popular
  static Future<PopularMod?> getPopular() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/movie/popular?api_key=$apiKey&language=en-US&page=1');

      PopularMod popularMod = PopularMod.fromJson(response.data);
      return popularMod;
    } catch (err) {
      print(err);
      return null;
    }
  }

//search movies by name
  static Future<SearchMod?> searchMoviesByName(String name) async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/search/movie?api_key=$apiKey&language=en-US&query=$name&page=1&include_adult=false');
      SearchMod searchMod = SearchMod.fromJson(response.data);
      print("searchMod.results.length ${searchMod.results?.first?.posterPath}");
      return searchMod;
    } catch (err) {
      print(err);
      print("error is $err");
    }
  }

  //get popular tv
  static Future<TVPopular?> getPopularTv() async {
    Dio dio = Dio();
    try {
      Response response = await dio
          .get('$hostDomain/tv/popular?api_key=$apiKey&language=en-US&page=1');

      TVPopular popularTvMod = TVPopular.fromJson(response.data);

      return popularTvMod;
    } catch (err) {
      print(err);
      return null;
    }
  }

  //get top rated tv
  static Future<TVPopular?> getTopRatedTv() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/tv/top_rated?api_key=$apiKey&language=en-US&page=1');

      TVPopular tvPopularMod = TVPopular.fromJson(response.data);
      return tvPopularMod;
    } catch (err) {
      print(err);
      return null;
    }
  }

  //get tv on the air
  static Future<TVPopular?> getTvOnTheAir() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/tv/on_the_air?api_key=$apiKey&language=en-US&page=1');

      TVPopular tvPopularMod = TVPopular.fromJson(response.data);
      return tvPopularMod;
    } catch (err) {
      print(err);
      return null;
    }
  }

  //get now playing tv
  static Future<TVPopular?> getNowPlayingTv() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
          '$hostDomain/tv/on_the_air?api_key=$apiKey&language=en-US&page=1');

      TVPopular tvPopularMod = TVPopular.fromJson(response.data);
      return tvPopularMod;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
