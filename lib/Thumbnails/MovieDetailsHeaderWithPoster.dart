import 'package:flutter/material.dart';
import 'package:search_movies/Model/Movie.dart';
import 'package:search_movies/Network/DataServices.dart';
import 'package:search_movies/Thumbnails/MovieDetailHeader.dart';
import 'package:search_movies/Thumbnails/MoviePoster.dart';

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movieObj;

  const MovieDetailsHeaderWithPoster({Key key, this.movieObj})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviePoster(
            poster: movieObj.poster,
          ),
          SizedBox(width: 10),
          Expanded(
              child: MovieDetailHeader(
            movieObj: movieObj,
          ))
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}
