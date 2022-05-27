import 'package:movie_app/database/model/movie.dart';
import 'package:movie_app/database/network/respondata.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'client.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/movie/")
abstract class RestClient {
  static const String apiKey ='e40e3108780dd1711cbbae5c9f2cfd52';
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("popular?api_key=$apiKey&language=en-US&page=1")
  Future<ResponseData<List<Movie>>> getMovie();
}

// @Query('staffId') String staffId,
// @Query('newPassword') String newPassword,
// @Query('confirmPassword') String confirmPassword
