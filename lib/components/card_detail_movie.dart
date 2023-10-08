import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/utils/hexcolor.dart';

class CardDetailMovie extends StatelessWidget {
  final Movie movie;

  const CardDetailMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Card(
      color: HexColor('#210F37').withOpacity(0.8),
      margin: EdgeInsets.only(top: height * 0.25),
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  child: Image.network(
                    movie.posterPath,
                    height: kIsWeb
                        ? height * 0.3
                        : height < 600
                            ? height * 0.4
                            : height * 0.25,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Subtitle(
                          title: 'Tagline',
                          text: movie.tagline,
                        ),
                        Subtitle(text: movie.status, title: 'Status'),
                        Subtitle(
                          title: 'Release Date',
                          text: movie.releaseDate,
                        ),
                        Subtitle(
                          title: 'Runtime',
                          text: movie.runtime,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${movie.voteAverage}/10',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.orange),
                        ),
                        RatingBar.builder(
                          initialRating: movie.voteAverage / 2,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: Colors.white,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 20,
                          onRatingUpdate: (rating) {},
                          tapOnlyMode: false,
                          ignoreGestures: true,
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String title;
  final String text;
  const Subtitle({Key? key, required this.text, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '$title: ',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            flex: 4,
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ))
      ],
    );
  }
}
