import 'dart:convert';

import 'package:http/http.dart';
import 'package:search_movies/Model/Movie.dart';
import 'package:search_movies/Model/Result.dart';

class DataService {
  final String urlString;

  DataService(this.urlString);

  Future<Result> fetchData() async {
    print("usrl string $urlString");
    Response apiResponse = await get(Uri.parse(urlString));
    if (apiResponse.statusCode == 200) {
      print(apiResponse.body);
      Result result = Result.fromJSON(json.decode(apiResponse.body));

      return result;
      // return apiResponse.body;
    } else {
      print(apiResponse.statusCode);
      throw Exception("failed");
    }
  }

  Future<Movie> getSelectedMovie() async {
    Response apiResponse = await get(Uri.parse(urlString));
    if (apiResponse.statusCode == 200) {
      Movie movie = Movie.fromJSON(json.decode(apiResponse.body));
      return movie;
    } else {
      throw Exception("failed");
    }
  }
}
