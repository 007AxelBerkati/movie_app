import 'package:flutter/material.dart';
import 'package:movie_app/components/card_detail_movie.dart';
import 'package:movie_app/model/movie.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(movie: movie);
      } else {
        return DetailMobilePage(
          movie: movie,
        );
      }
    });
  }
}

class DetailWebPage extends StatelessWidget {
  final Movie movie;
  const DetailWebPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.3),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  children: <Widget>[
                    Image.network(movie.backdropPath,
                        height: screenHeight * 0.4,
                        width: screenWidth,
                        fit: BoxFit.fill),
                    SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back),
                            color: Colors.white,
                          )),
                    )),
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: CardDetailMovie(
                          movie: movie,
                        ))
                  ],
                );
              },
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Synopsis',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          height: 1.5,
                          wordSpacing: 2),
                    )
                  ],
                ))
          ]),
    ));
  }
}

class DetailMobilePage extends StatelessWidget {
  final Movie movie;

  const DetailMobilePage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(movie.backdropPath,
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    fit: BoxFit.fill),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                      )),
                )),
                Padding(
                    padding: const EdgeInsets.all(16),
                    child: CardDetailMovie(
                      movie: movie,
                    ))
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Synopsis',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.overview,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          height: 1.5,
                          wordSpacing: 2),
                    )
                  ],
                ))
          ]),
    ));
  }
}
