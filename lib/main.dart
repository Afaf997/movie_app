import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/bottomnavigation.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/views/homescreen.dart';
import 'package:movie_app/views/screen.dart';
import 'package:movie_app/views/splash.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized(); 
   await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform
    options: const FirebaseOptions(
      apiKey: "AIzaSyAW8gYjcIwg78GZ-M9b7EyDEkWlpNnIVao",
       appId:"1:459735895311:android:a40963483b68efa034827a",
        messagingSenderId: "459735895311", 
        projectId:"authenticationbloc-d1ff7",)
);
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'movie app',
       theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
       ),
       home:StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges() ,
        builder:(context,snapshot){
           if(snapshot.data == null){
            return const ScreenPage();
           }else{
            return HomeScreen();
           }
        } ,)
      ),
    );
  }
}
