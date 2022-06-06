
class MovieModel{
  final int id;
  final String posterPath;
  final String overview;
  final String backdropPath;
  final String originalTitle;
  final double popularity;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieModel(
      {required this.id,
        required this.posterPath,
        required this.overview,
        required this.backdropPath,
        required this.originalTitle,
        required this.popularity,
        required this.title,
        required this.voteAverage,
        required this.voteCount});
}

