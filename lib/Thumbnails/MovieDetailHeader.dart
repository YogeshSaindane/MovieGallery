import 'package:flutter/material.dart';
import 'package:search_movies/Model/Movie.dart';

class MovieDetailHeader extends StatelessWidget {
  final Movie movieObj;

  const MovieDetailHeader({Key key, this.movieObj}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${movieObj.year} - ${movieObj.genre}",
            style: TextStyle(color: Colors.red.shade400, fontSize: 13),
          ),
          Text(
            "${movieObj.title}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text.rich(TextSpan(style: TextStyle(fontSize: 15), children: [
            TextSpan(text: movieObj.plot),
            TextSpan(
                text: "more...", style: TextStyle(color: Colors.red.shade400))
          ]))
        ],
      ),
    );
  }
}
