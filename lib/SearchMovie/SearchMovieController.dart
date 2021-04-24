import 'dart:async';

import 'package:flutter/material.dart';

import 'package:search_movies/Model/Movie.dart';
import 'package:search_movies/Model/Result.dart';
import 'package:search_movies/Network/DataServices.dart';
import 'package:search_movies/SearchMovie/MovieDetails.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  Future<Result> movieListData;
  String movieName = "";
  List<String> posterList;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   movieListData = getData(movieName);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Movie"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            // color: Colors.purple.shade50,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  hintText: "Enter movie name here...",
                  labelText: "Movie",
                  border: OutlineInputBorder()),
              onSubmitted: searchClicked,
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.transparent,
            height: 20,
          ),
          Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height - 60,
              child: FutureBuilder(
                future: getData(movieName),
                builder: (context, AsyncSnapshot<Result> snapashot) {
                  if (snapashot.hasData) {
                    Result result = snapashot.data;
                    return createMovieListWithPoster(result, context);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createMovieListWithPoster(data, BuildContext context) {
    // List list = data["Search"];

    Result result = data;
    return Container(
      child: ListView.builder(
          itemCount: result.moviList.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Image.network(
                                  result.moviList[index].poster,
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Flexible(
                                  child: Text(
                                    "${result.moviList[index].title} (${result.moviList[index].year})",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  // title: Text(result.moviList[index].title),
                  // subtitle: Text(result.moviList[index].year),
                  // leading: Image.network(
                  //   result.moviList[index].poster,
                  // ),

                  // title: Text(data),
                  onTap: () {
                    _navigateToDetailPage(result.moviList[index], context);
                  }),
            );
          }),
    );
  }

  Widget createMovieListView(data, BuildContext context) {
    // List list = data["Search"];

    Result result = data;
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: result.moviList.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                color: Colors.blue.shade50,
                child: ListTile(
                    title: Text(result.moviList[index].title),
                    subtitle: Text(result.moviList[index].year),
                    leading: Image.network(
                      result.moviList[index].poster,
                    ),

                    // title: Text(data),
                    onTap: () {
                      _navigateToDetailPage(result.moviList[index], context);
                    }),
              ),
            );
          }),
    );
  }

  Future<Result> getData(String movieStr) {
    movieListData = null;

    if (movieStr == "") {
      return movieListData;
    }
    movieName = movieStr;
    var urlString = "http://www.omdbapi.com/?apikey=c0b7c24c&s=$movieStr";
    setState(() {
      movieListData = DataService(urlString).fetchData();
      // movieListData.then((value) => {
      //       posterList = null,
      //       posterList = [],
      //       for (var item in value.moviList)
      //         {
      //           print("movie name ${item.title}\n ${item.poster}"),
      //           posterList.add(item.poster),
      //         },
      //       // debugPrint("posterList $posterList")
      //     });
    });

    return movieListData;
  }

  List<String> getPosterList(Result movieResult) {
    List<String> posterList;

    for (var item in movieResult.moviList) {
      posterList.add(item.poster);
    }

    return posterList;
  }

  _navigateToDetailPage(Movie movie, BuildContext context) {
    // debugPrint("movie clicked: ${movieList.elementAt(index)}"),
    debugPrint("movie clicked: ${movie.title}");
    Future<Movie> selectedMovie =
        DataService("http://www.omdbapi.com/?apikey=c0b7c24c&t=${movie.title}")
            .getSelectedMovie();
    selectedMovie.then((value) => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetails(
                        movieObject: value,
                        moviePoster: posterList,
                      )))
        });
  }

  void searchClicked(String value) {
    setState(() {
      movieName = value;
    });
  }
}
