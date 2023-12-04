import 'package:flutter/material.dart';
import 'package:movie_app/views/homescreen.dart';
import 'package:movie_app/views/screen.dart';
import 'package:movie_app/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movie app',
     theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      useMaterial3: true,
     ),
     home: SplashScreen(),
    );
  }
}
