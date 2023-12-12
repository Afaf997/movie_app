import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/controller/bottomNavigation.dart';
import 'package:movie_app/apps/views/Homescreen.dart';
import 'package:movie_app/apps/views/moviedetails.dart';
import 'package:movie_app/apps/views/new_screen.dart';
import 'package:movie_app/apps/views/tvshowscreens.dart';
import 'package:movie_app/apps/widget/botoomnavigation.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "YOUR_API_KEY",
  //     appId: "YOUR_APP_ID",
  //     messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
  //     projectId: "YOUR_PROJECT_ID",
  //   ),
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movie app',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: HomeScreen(),
            getPages: [
        // GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/main', page: () => BottomNavigation()),
        // GetPage(name: '/search', page: () => const SearchScreen()),
        GetPage(name: '/news', page: () => NewsHomeScreen()),
        GetPage(
          name: '/movie/:id',
          page: () => MovieScreen(movieId: Get.parameters['id']!),
        ),
        GetPage(
          name: '/tv/:id',
          page: () => TVShowScreen(Get.parameters['id']!),
        ),
      ],
      // initialBinding: BindingsBuilder(() {
      //   Get.put(NavigationController());
      // }),
      // Uncomment the following if you want to use StreamBuilder for authentication
      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return SplashScreen();
      //     } else if (snapshot.hasData) {
      //       return HomeScreen();
      //     } else {
      //       return ScreenPage();
      //     }
      //   },
      // ),
    );
  }
}