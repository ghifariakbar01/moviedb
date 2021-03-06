///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SearchModResults {
/*
{
  "backdrop_path": "/ecxpOnYv7iTUVNUmZRoxRksaC1f.jpg",
  "first_air_date": "2005-09-17",
  "genre_ids": [
    16
  ],
  "id": 1769,
  "name": "Johnny Test",
  "origin_country": [
    "CA"
  ],
  "original_language": "en",
  "original_name": "Johnny Test",
  "overview": "Young Johnny is gung-ho and full of courage. Johnny's brainiac twin sisters, Susan and Mary, use Johnny as their guinea pig for their outrageous scientific experiments. If they can dream it up, Johnny will do it; as long as his genetically engineered super dog, Dukey, can come along.",
  "popularity": 34.8,
  "poster_path": "/rn5YbXP4UunS0BLhmjqndHJYhp.jpg",
  "vote_average": 5.7,
  "vote_count": 98
} 
*/

  String? backdropPath;
  String? firstAirDate;
  List<int?>? genreIds;
  int? id;
  String? name;
  List<String?>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  SearchModResults({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });
  SearchModResults.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path']?.toString();
    firstAirDate = json['first_air_date']?.toString();
    if (json['genre_ids'] != null && (json['genre_ids'] is List)) {
      final v = json['genre_ids'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(int.parse(v.toString()));
      });
      genreIds = arr0;
    }
    id = int.tryParse(json['id']?.toString() ?? '');
    name = json['name']?.toString();
    if (json['origin_country'] != null && (json['origin_country'] is List)) {
      final v = json['origin_country'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      originCountry = arr0;
    }
    originalLanguage = json['original_language']?.toString();
    originalName = json['original_name']?.toString();
    overview = json['overview']?.toString();
    popularity = double.tryParse(json['popularity']?.toString() ?? '');
    posterPath = json['poster_path']?.toString();
    voteAverage = double.tryParse(json['vote_average']?.toString() ?? '');
    voteCount = int.tryParse(json['vote_count']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['first_air_date'] = firstAirDate;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['genre_ids'] = arr0;
    }
    data['id'] = id;
    data['name'] = name;
    if (originCountry != null) {
      final v = originCountry;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['origin_country'] = arr0;
    }
    data['original_language'] = originalLanguage;
    data['original_name'] = originalName;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}

class SearchMod {
/*
{
  "page": 1,
  "results": [
    {
      "backdrop_path": "/ecxpOnYv7iTUVNUmZRoxRksaC1f.jpg",
      "first_air_date": "2005-09-17",
      "genre_ids": [
        16
      ],
      "id": 1769,
      "name": "Johnny Test",
      "origin_country": [
        "CA"
      ],
      "original_language": "en",
      "original_name": "Johnny Test",
      "overview": "Young Johnny is gung-ho and full of courage. Johnny's brainiac twin sisters, Susan and Mary, use Johnny as their guinea pig for their outrageous scientific experiments. If they can dream it up, Johnny will do it; as long as his genetically engineered super dog, Dukey, can come along.",
      "popularity": 34.8,
      "poster_path": "/rn5YbXP4UunS0BLhmjqndHJYhp.jpg",
      "vote_average": 5.7,
      "vote_count": 98
    }
  ],
  "total_pages": 8,
  "total_results": 146
} 
*/

  int? page;
  List<SearchModResults?>? results;
  int? totalPages;
  int? totalResults;

  SearchMod({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  SearchMod.fromJson(Map<String, dynamic> json) {
    page = int.tryParse(json['page']?.toString() ?? '');
    if (json['results'] != null && (json['results'] is List)) {
      final v = json['results'];
      final arr0 = <SearchModResults>[];
      v.forEach((v) {
        arr0.add(SearchModResults.fromJson(v));
      });
      results = arr0;
    }
    totalPages = int.tryParse(json['total_pages']?.toString() ?? '');
    totalResults = int.tryParse(json['total_results']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['results'] = arr0;
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
