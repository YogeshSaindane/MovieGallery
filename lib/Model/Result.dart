import 'package:search_movies/Model/Movie.dart';

class Result {
  List<Movie> moviList;
  String totalResults;
  String response;
  Result({
    this.moviList,
    this.totalResults,
    this.response,
  });

  factory Result.fromJSON(Map<String, dynamic> json) {
    if ((json["Search"] as List) != null) {
      return Result(
          moviList: (json["Search"] as List)
              .map((tempM) => Movie.fromJSON(tempM))
              .toList(),
          totalResults: json["totalResults"],
          response: json["Response"]);
    } else {
      return null;
    }
  }
}

class Poster {
  final List<String> posterList;

  Poster(this.posterList);
}
