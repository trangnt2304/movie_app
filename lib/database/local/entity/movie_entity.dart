class MovieEntity {
  final int id;
  final String poster_path;
  final String overview;
  final String backdrop_path;
  final String original_title;
  final double popularity;
  final String title;
  final double vote_average;
  final int vote_count;

  const MovieEntity(
      {required this.id,
      required this.poster_path,
      required this.overview,
      required this.backdrop_path,
      required this.original_title,
      required this.popularity,
      required this.title,
      required this.vote_average,
      required this.vote_count});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'poster_path': poster_path,
      'overview': overview,
      'backdrop_path': backdrop_path,
      'original_title': original_title,
      'popularity': popularity,
      'title': title,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }
  MovieEntity.fromMap(Map<String, dynamic> res) :
        id = res["id"],
        poster_path = res["poster_path"],
        overview = res["overview"],
        backdrop_path = res["backdrop_path"],
        original_title = res["original_title"],
        popularity = res["popularity"],
        title = res["title"],
        vote_average = res["vote_average"],
        vote_count = res["vote_count"]
  ;
      

}
