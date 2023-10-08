import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/home_screen.dart';
import 'package:movie_app/splash_screen.dart';
import 'package:movie_app/utils/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('#210F37'),
            statusBarIconBrightness: Brightness.light,
          )),
          fontFamily: 'Nunito',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
              .copyWith(background: HexColor('#210F37'))),
      home: const SplashScreen(),
    );
  }
}
