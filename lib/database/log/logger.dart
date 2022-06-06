import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/database/network/client.dart';

final logger = Logger();
void main(List<String> args) {
  final dio = Dio(); // Provide a dio instance
  dio.options.headers["Demo-Header"] =
      "demo header"; // config your dio headers globally
  final client = RestClient(dio);

  client.getMovie().then((it) => logger.i(it));
}

