class Movie {
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final String status;
  final String tagline;
  final String runtime;
  final int id;

  Movie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
    required this.status,
    required this.tagline,
    required this.runtime,
  });
}

var movieList = [
  Movie(
    title: "Minions: The Rise of Gru",
    overview:
        "The continuation of the adventures of the Minions, always in search of a tyrannical leader.",
    posterPath:
        "https://m.media-amazon.com/images/M/MV5BNDM3YWEwYTMtNmY3ZS00YzJiLWFlNWItOWFmNjY0YzA4ZDE3XkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg",
    backdropPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgkh4JHSY4h4DwmBM0MsItt-tlPOKVp6KrqQ&usqp=CAU",
    releaseDate: "2022-06-15",
    voteAverage: 8.1,
    tagline: 'The Rise of Gru',
    status: 'Released',
    runtime: '1h 30m',
    id: 1,
  ),
  Movie(
    title: "Luca",
    overview:
        "Luca and his best friend Alberto experience an unforgettable summer on the Italian Riviera. But all the fun is threatened by a deeply-held secret: they are sea monsters from another world just below the water’s surface.",
    posterPath:
        "https://myhotposters.com/cdn/shop/products/mL5374_1024x1024.jpg?v=1623612759",
    backdropPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCJg1jkuLXA2uP2ig6YH9cc9Q6mUDLPtFBvg&usqp=CAU",
    releaseDate: "2021-06-17",
    voteAverage: 8.2,
    tagline: 'Dive into a sea of adventure',
    status: 'Released',
    runtime: '1h 35m',
    id: 2,
  ),
  Movie(
    title: "Black Widow",
    overview:
        "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.",
    posterPath:
        "https://artofthemovies.co.uk/cdn/shop/products/IMG_8570-522429.jpg?v=1611687837",
    backdropPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiUxWGvZ3cGLHr4h_njACD2be8yNb7G6vgPQ&usqp=CAU",
    releaseDate: "2021-07-07",
    voteAverage: 7.8,
    tagline: 'Her world. Her secrets. Her legacy.',
    status: 'Released',
    runtime: '2h 14m',
    id: 3,
  ),
  Movie(
    title: "The Boss Baby: Family Business",
    overview:
        "The Templeton brothers — Tim and his Boss Baby little bro Ted — have become adults and drifted away from each other. But a new boss baby with a cutting-edge approach and a can-do attitude is about to bring them together again … and inspire a new family business.",
    posterPath:
        "https://m.media-amazon.com/images/M/MV5BNWIwZWVjNzAtODhhNS00ZDRiLWFhMzktODZhMjBkMzA2OWViXkEyXkFqcGdeQXVyOTcyNTkzOTA@._V1_.jpg",
    backdropPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQTJfeGPcj6TvXKuh78atxXTfXSKKO2yYAFi1FUt2EF-2OAbd-M0NvyPGISisMXMqYEWg&usqp=CAU",
    releaseDate: "2021-07-01",
    tagline: 'Playtime is over.',
    status: 'Released',
    runtime: '1h 47m',
    voteAverage: 7.9,
    id: 4,
  ),
  Movie(
    title: "Cruella",
    overview:
        "In 1970s London amidst the punk rock revolution, a young grifter named Estella is determined to ",
    posterPath:
        "https://m.media-amazon.com/images/M/MV5BOWI5YTUxOWEtZmRiZS00ZmQxLWE2NzctYTRiODA2NzE1ZjczXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_UY1200_CR90,0,630,1200_AL_.jpg",
    backdropPath:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShXVZXZDkvu_JIUtVlTLZgjCsiDoASF0n-nw&usqp=CAU",
    releaseDate: "2021-05-26",
    voteAverage: 8.5,
    tagline: 'Hello Cruel World',
    status: 'Released',
    runtime: '2h 14m',
    id: 5,
  ),
];
