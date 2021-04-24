import 'package:flutter/material.dart';
import 'package:search_movies/Model/Movie.dart';
import 'package:search_movies/Thumbnails/MovieDetailsCast.dart';
import 'package:search_movies/Thumbnails/MovieDetailsHeaderWithPoster.dart';
import 'package:search_movies/Thumbnails/MovieDetailsThumbnails.dart';
import 'package:search_movies/Thumbnails/MovieExtraPosters.dart';

class MovieDetails extends StatelessWidget {
  final Movie movieObject;
  final List<String> moviePoster;
  // final List posters = Movie.getPosterList();
  const MovieDetails({Key key, this.movieObject, this.moviePoster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieObject.title),
        // backgroundColor: Colors.red.shade400,
      ),
      body: ListView(
        children: [
          MovieDetailsThumbnails(
            thumbnail: movieObject.poster,
          ),
          MovieDetailsHeaderWithPoster(
            movieObj: movieObject,
          ),
          HorizontalLine(),
          MovieDetailsCast(
            movieObj: movieObject,
          ),
          SizedBox(
            height: 20,
          )
          // HorizontalLine(),
          // MovieExtraPosters(
          //   posters: moviePoster,
          // )
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: ElevatedButton(
      //       onPressed: () {
      //         debugPrint("back pressed");
      //         Navigator.pop(context);
      //       },
      //       child: Text("Go back to ${movieObject.title}"),
      //     ),
      //   ),
      // ),
    );
  }
}
