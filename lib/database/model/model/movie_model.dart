
class MovieModel{
  final int id;
  final String poster_path;
  final String overview;
  final String backdrop_path;
  final String original_title;
  final double popularity;
  final String title;
  final double vote_average;
  final int vote_count;

  const MovieModel(
      {required this.id,
        required this.poster_path,
        required this.overview,
        required this.backdrop_path,
        required this.original_title,
        required this.popularity,
        required this.title,
        required this.vote_average,
        required this.vote_count});
}