import 'package:flutter/material.dart';

class CardRecommended extends StatelessWidget {
  final String moviePoster;
  const CardRecommended({Key? key, required this.moviePoster})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          moviePoster,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
