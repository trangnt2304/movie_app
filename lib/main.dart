import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common/bloc_observer/observer.dart';
import 'package:movie_app/locator.dart';
import 'package:movie_app/presentation/my_app.dart';

void main() {
  setupLocator();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: Observer(),
  );
}

