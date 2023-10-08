import 'package:flutter/material.dart';
import 'package:movie_app/components/card_latest_upload.dart';
import 'package:movie_app/components/card_movie_web_page.dart';
import 'package:movie_app/components/card_recommended.dart';
import 'package:movie_app/detail_screen.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return const HomeWebPage();
      } else {
        return const HomeMobilePage();
      }
    });
  }
}

class HomeWebPage extends StatelessWidget {
  const HomeWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortLatestUpload = [...movieList]
      ..sort((a, b) => b.releaseDate.compareTo(a.releaseDate));

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
      child: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: screenWidth <= 1200 ? 800 : 1200,
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Movie App',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: screenHeight <= 1200 ? 300 : 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var sortRecommended = [...movieList]
                      ..sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      movie: sortRecommended[index])));
                        },
                        child: CardMovieWebPage(
                          movie: sortRecommended[index],
                        ));
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Upload',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight <= 1200 ? 300 : 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                      movie: sortLatestUpload[index])));
                        },
                        child: CardMovieWebPage(
                          movie: sortLatestUpload[index],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    )));
  }
}

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortLatestUpload = [...movieList]
      ..sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Movie App',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  var sortRecommended = [...movieList]
                    ..sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    movie: sortRecommended[index])));
                      },
                      child: CardRecommended(
                        moviePoster: sortRecommended[index].posterPath,
                      ));
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Upload',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              children: sortLatestUpload.map((movie) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(movie: movie)));
                    },
                    child: CardLatestUpload(movie: movie));
              }).toList(),
            )
          ],
        ),
      ),
    )));
  }
}
