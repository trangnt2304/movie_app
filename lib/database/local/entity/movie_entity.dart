class MovieEntity {
  final int id;
  final String posterPath;
  final String overview;
  final String backdropPath;
  final String originalTitle;
  final double popularity;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieEntity(
      {required this.id,
      required this.posterPath,
      required this.overview,
      required this.backdropPath,
      required this.originalTitle,
      required this.popularity,
      required this.title,
      required this.voteAverage,
      required this.voteCount});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'poster_path': posterPath,
      'overview': overview,
      'backdrop_path': backdropPath,
      'original_title': originalTitle,
      'popularity': popularity,
      'title': title,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  MovieEntity.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        posterPath = res["poster_path"],
        overview = res["overview"],
        backdropPath = res["backdrop_path"],
        originalTitle = res["original_title"],
        popularity = res["popularity"],
        title = res["title"],
        voteAverage = res["vote_average"],
        voteCount = res["vote_count"];
}

