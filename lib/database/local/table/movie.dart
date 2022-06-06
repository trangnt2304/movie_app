const String tableMovies = 'movies';

class MovieFields {
  static final List<String> values = [
    posterPath,
    adult,
    overview,
    backdropPath,
    releaseDate,
    genreIds,
    id,
    originalTitle,
    originalLanguage,
    popularity,
    title,
    video,
    voteAverage,
    voteCount
  ];
  static const String posterPath = 'poster_path';
  static const String adult = 'adult';
  static const String overview = 'overview';
  static const String backdropPath = 'backdrop_path';
  static const String releaseDate = 'release_date';
  static const String genreIds = 'genre_ids';
  static const String id = '_id';
  static const String originalTitle = 'original_title';
  static const String originalLanguage = 'original_language';
  static const String popularity = 'popularity';
  static const String title = 'title';
  static const String video = 'video';
  static const String voteAverage = 'vote_average';
  static const String voteCount = 'vote_count';
}

class Movie {
  String? posterPath;
  bool? adult;
  String? overview;
  String? backdropPath;
  String? releaseDate;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? originalLanguage;
  double? popularity;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Movie(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movie copy({
    String? posterPath,
    bool? adult,
    String? overview,
    String? backdropPath,
    String? releaseDate,
    List<int>? genreIds,
    int? id,
    String? originalTitle,
    String? originalLanguage,
    double? popularity,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      Movie(
        id: id ?? this.id,
        adult: adult ?? this.adult,
        posterPath: posterPath ?? this.posterPath,
        overview: overview ?? this.overview,
        backdropPath: backdropPath ?? this.backdropPath,
        releaseDate: releaseDate ?? this.releaseDate,
        genreIds: genreIds ?? this.genreIds,
        originalTitle: originalTitle ?? this.originalTitle,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        popularity: popularity ?? this.popularity,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  Map<String, Object?> toJson() => {
        MovieFields.adult: adult == true ? 1 : 0,
        MovieFields.backdropPath: backdropPath,
        MovieFields.genreIds: genreIds,
        MovieFields.id: id,
        MovieFields.originalLanguage: originalLanguage,
        MovieFields.originalTitle: originalTitle,
        MovieFields.overview: overview,
        MovieFields.popularity: popularity,
        MovieFields.posterPath: posterPath,
        MovieFields.releaseDate: releaseDate,
        MovieFields.title: title,
        MovieFields.video: video! ? 1 : 0,
        MovieFields.voteAverage: voteAverage,
        MovieFields.voteCount: voteCount,
      };
  static Movie fromJson(Map<String, Object?> json) => Movie(
        adult: json['adult'] as bool?,
        backdropPath: json['backdrop_path'] as String?,
        genreIds: (json['genre_ids'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList(),
        id: json['id'] as int?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: json['poster_path'] as String?,
        releaseDate: json['release_date'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
      );
}

