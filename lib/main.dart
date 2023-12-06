// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/firebase_options.dart';
// import 'package:movie_app/google_Auth/views/splash.dart';
// import 'package:movie_app/moviesDocument/controller/bottomNavigation.dart';
// import 'package:provider/provider.dart';

// void main()async{
//   WidgetsFlutterBinding.ensureInitialized(); 
//    await Firebase.initializeApp(
//     // options: DefaultFirebaseOptions.currentPlatform
//     options: const FirebaseOptions(
//       apiKey: "AIzaSyAW8gYjcIwg78GZ-M9b7EyDEkWlpNnIVao",
//        appId:"1:459735895311:android:a40963483b68efa034827a",
//         messagingSenderId: "459735895311", 
//         projectId:"authenticationbloc-d1ff7",)
// );
//    runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => NavigationProvider()),
        
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'movie app',
//        theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: Colors.black,
//        ),
//        home: SplashScreen(),
//       //  home: StreamBuilder(
//       //     stream: FirebaseAuth.instance.authStateChanges(),
//       //     builder: (context, snapshot) {
//       //       if (snapshot.connectionState == ConnectionState.waiting) {
//       //         return SplashScreen(); // Show a loading indicator or splash screen
//       //       } else if (snapshot.hasData) {
//       //         return HomeScreen();
//       //       } else {
//       //         return ScreenPage();
//       //       }
//       //     },
//       //   ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/google_Auth/views/splash.dart';
import 'package:movie_app/moviesDocument/controller/bottomNavigation.dart';
import 'package:movie_app/moviesDocument/views/Homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "YOUR_API_KEY",
      appId: "YOUR_APP_ID",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      projectId: "YOUR_PROJECT_ID",
    ),
  );
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
      home: SplashScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put(NavigationController());
      }),
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