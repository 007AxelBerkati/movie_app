import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/hexcolor.dart';

class CardMovieWebPage extends StatelessWidget {
  final Movie movie;
  const CardMovieWebPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        color: HexColor('#210F37'),
        child: SizedBox(
          width: screenWidth * 0.12,
          height: screenWidth * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          movie.posterPath,
                          width: screenWidth * 0.12,
                          height: screenWidth * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        right: 16,
                        top: 5,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 20,
                              color: Colors.yellow,
                            ),
                            Text(
                              movie.voteAverage.toString(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            movie.tagline,
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      )))
            ],
          ),
        ));
  }
}
