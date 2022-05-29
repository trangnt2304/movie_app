import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app/presentation/journey/login/login_widget.dart';
import 'package:movie_app/presentation/themes.dart';
import 'package:movie_app/presentation/welcome_screen.dart';



class MyApp extends StatelessWidget {
  static final String title = 'User Profile';

  @override
  Widget build(BuildContext context) {

    return Builder(
        builder: (context) => MaterialApp(
          localizationsDelegates: const [
            // AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('vi', 'VN'),
            Locale('en', 'US'),
          ],
          debugShowCheckedModeBanner: false,
          theme: MyThemes.lightTheme,
          title: title,
          home: WelcomeScreen(),
        ),
      );
  }
}