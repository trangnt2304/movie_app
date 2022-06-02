final String tableMovies = 'movies';

class MovieFields {
  static final List<String> values = [
    poster_path,
    adult,
    overview,
    backdrop_path,
    release_date,
    genre_ids,
    id,
    original_title,
    original_language,
    popularity,
    title,
    video,
    vote_average,
    vote_count
  ];
  static final String poster_path = 'poster_path';
  static final String adult = 'adult';
  static final String overview = 'overview';
  static final String backdrop_path = 'backdrop_path';
  static final String release_date = 'release_date';
  static final String genre_ids = 'genre_ids';
  static final String id = '_id';
  static final String original_title = 'original_title';
  static final String original_language = 'original_language';
  static final String popularity = 'popularity';
  static final String title = 'title';
  static final String video = 'video';
  static final String vote_average = 'vote_average';
  static final String vote_count = 'vote_count';
}

class Movie {
  String? poster_path;
  bool? adult;
  String? overview;
  String? backdrop_path;
  String? release_date;
  List<int>? genre_ids;
  int? id;
  String? original_title;
  String? original_language;
  double? popularity;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;
  Movie(
      {this.adult,
      this.backdrop_path,
      this.genre_ids,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_average,
      this.vote_count});

  Movie copy({
    String? poster_path,
    bool? adult,
    String? overview,
    String? backdrop_path,
    String? release_date,
    List<int>? genre_ids,
    int? id,
    String? original_title,
    String? original_language,
    double? popularity,
    String? title,
    bool? video,
    double? vote_average,
    int? vote_count,
  }) =>
      Movie(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        poster_path: poster_path ?? this.poster_path,
        overview: overview ?? this.overview,
        backdrop_path: backdrop_path ?? this.backdrop_path,
        release_date: release_date ?? this.release_date,
        genre_ids: genre_ids ?? this.genre_ids,
        original_title: original_title ?? this.original_title,
        original_language: original_language ?? this.original_language,
        popularity: popularity ?? this.popularity,
        title: title ?? this.title,
        video: video ?? this.video,
        vote_average: vote_average ?? this.vote_average,
        vote_count: vote_count ?? this.vote_count,
      );

  Map<String, Object?> toJson() => {
        MovieFields.adult: adult! ? 1 : 0,
        MovieFields.backdrop_path: backdrop_path,
        MovieFields.genre_ids: genre_ids,
        MovieFields.id: id,
        MovieFields.original_language: original_language,
        MovieFields.original_title: original_title,
        MovieFields.overview: overview,
        MovieFields.popularity: popularity,
        MovieFields.poster_path: poster_path,
        MovieFields.release_date: release_date,
        MovieFields.title: title,
        MovieFields.video: video! ? 1 : 0,
        MovieFields.vote_average: vote_average,
        MovieFields.vote_count: vote_count,
      };
  static Movie fromJson(Map<String, Object?> json) => Movie(
        adult: json['adult'] as bool?,
        backdrop_path: json['backdrop_path'] as String?,
        genre_ids: (json['genre_ids'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList(),
        id: json['id'] as int?,
        original_language: json['original_language'] as String?,
        original_title: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        poster_path: json['poster_path'] as String?,
        release_date: json['release_date'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        vote_average: (json['vote_average'] as num?)?.toDouble(),
        vote_count: json['vote_count'] as int?,
      );
}
