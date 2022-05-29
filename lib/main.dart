
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/bloc_observer/observer.dart';
import 'package:movie_app/common/config_firebase/firebase_config.dart';
import 'package:movie_app/presentation/my_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FireBaseConFig.instance.initFireBase();
  BlocOverrides.runZoned(
    () => runApp( MyApp()),
    blocObserver: Observer(),
  );
}

