import 'package:flutter/material.dart';
import 'package:search_movies/Model/Movie.dart';
import 'package:search_movies/Network/DataServices.dart';
import 'package:search_movies/Thumbnails/MovieFields.dart';

class MovieDetailsCast extends StatelessWidget {
  final Movie movieObj;

  const MovieDetailsCast({Key key, this.movieObj}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          MovieFields(
            field: "Cast",
            value: movieObj.actors,
          ),
          MovieFields(
            field: "Directors",
            value: movieObj.director,
          ),
          MovieFields(
            field: "Writer",
            value: movieObj.writer,
          ),
          MovieFields(
            field: "Language",
            value: movieObj.language,
          ),
          MovieFields(
            field: "Awards",
            value: movieObj.awards,
          ),
          MovieFields(
            field: "Production",
            value: movieObj.production,
          ),
          MovieFields(
            field: "Box Office",
            value: movieObj.boxOffice,
          ),
          MovieFields(
            field: "imdb Rating",
            value: "${movieObj.imdbRating} / 10",
          ),
          MovieFields(
            field: "imdb Votes",
            value: movieObj.imdbVotes,
          )
        ],
      ),
    );
  }
}
// class MovieFields extends StatelessWidget {
//   final String field;
//   final String value;

//   const MovieFields({Key key, this.field, this.value}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "$field : ",
//           style: TextStyle(color: Colors.grey.shade400),
//         ),
//         Expanded(child: Text(value)),
//       ],
//     );
//   }
// }