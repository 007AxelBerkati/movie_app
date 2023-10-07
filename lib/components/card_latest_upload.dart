import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/hexcolor.dart';

class CardLatestUpload extends StatelessWidget {
  final Movie movie;
  const CardLatestUpload({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: HexColor('#210F37'),
        elevation: 10,
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(20),
                child: Image.network(
                  movie.posterPath,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              movie.overview,
                              maxLines: 5,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                movie.voteAverage.toString(),
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ]),
                ))
          ],
        ));
  }
}
