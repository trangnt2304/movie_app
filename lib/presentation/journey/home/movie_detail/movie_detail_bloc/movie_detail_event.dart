
abstract class MovieDetailEvent{}

class MovieDetailInitEvent extends MovieDetailEvent{}

class MovieDetailChangeReadMoreEvent extends MovieDetailInitEvent {

  final bool? isReadmore;

  MovieDetailChangeReadMoreEvent({this.isReadmore});
}