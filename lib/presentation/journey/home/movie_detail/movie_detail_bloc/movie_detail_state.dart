
abstract class MovieDetailState {}

class MovieDetaiInitState extends MovieDetailState{

  MovieDetaiInitState(): super();

}

class MovieDetailReadMoreState extends MovieDetailState{

  final bool isReadMore;

  MovieDetailReadMoreState({required this.isReadMore});

}