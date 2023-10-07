import 'package:flutter/material.dart';
import 'package:movie_app/home_screen.dart';
import 'package:movie_app/utils/hexcolor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const HomeScreen(), // Replace MainScreen with your actual main screen widget
        ),
      );
    });
    return Container(
        color: HexColor('#210F37'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo2.png',
                width: 100, height: 100, fit: BoxFit.contain),
            const Text(
              "Movie App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ],
        ));
  }
}
