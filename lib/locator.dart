import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/database/local/database.dart';
import 'package:movie_app/database/network/client.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(RestClient(Dio(BaseOptions(contentType: "application/json"))));

  locator.registerSingleton(DatabaseHandler());
}
