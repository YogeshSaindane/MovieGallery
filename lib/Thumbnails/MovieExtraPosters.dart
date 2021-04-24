import 'package:flutter/material.dart';
import 'package:search_movies/Model/Movie.dart';

class MovieExtraPosters extends StatelessWidget {
  // final List<String> posters = Movie.getPosterList();
  final List<String> posters;

  const MovieExtraPosters({Key key, this.posters}) : super(key: key);
  // const MovieExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: Text("Other Movies : "),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Container(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemCount: posters.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  // height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(posters[index]),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
