import 'package:movie_app/database/model/list/actor.dart';
import 'package:movie_app/database/model/movie.dart';
import 'package:movie_app/database/network/respondata.dart';
import 'package:movie_app/database/network/respondcast.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie/")
abstract class RestClient {
  static const String apiKey ='e40e3108780dd1711cbbae5c9f2cfd52';
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("popular?api_key=$apiKey&language=en-US&page=1")
  Future<ResponseData<List<MovieJson>>> getMovie();

  @GET("{movie_id}/credits?api_key=$apiKey&language=en-US&page=1")
  Future<ResponseCast<List<Cast>>> getCast(@Path("movie_id") int movie_id);
}

// @Query('staffId') String staffId,
// @Query('newPassword') String newPassword,
// @Query('confirmPassword') String confirmPassword
