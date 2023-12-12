import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/apps/controller/maincontroller.dart';
import 'package:movie_app/apps/views/search_Screen.dart';
import 'package:movie_app/apps/widget/botoomnavigation.dart';
import 'package:movie_app/apps/widget/Movie_carosel.dart';
import 'package:movie_app/apps/widget/drawer.dart';
import 'package:movie_app/apps/widget/fullslider.dart';
import 'package:movie_app/apps/widget/movieslider.dart';



class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
     leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              iconSize: 32,
            );
          },
        ),

        actions: [IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=> SearchScreen()));},
         icon:const Icon(Icons.search),
         iconSize: 33,)],
      ),
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarouselSlider(data: mainController.popularShows),
              const SizedBox( height: 32,
              ),
              Text( "Top rated Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24),
              ),
             const SizedBox( height: 32,
              ),
              MovieSlider(
                        popularMovies: mainController.topRatedMovie),
              const SizedBox(height: 32),
              Text( "Now Playing Movie",
                style: GoogleFonts.aBeeZee(fontSize: 24)),
             const SizedBox( height: 32),
              FullSlider(popularMovies: mainController.nowPLayingMovie),
               const SizedBox(height: 32,),
               Text( "Animated Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24)),
               MovieSlider(popularMovies:mainController.animatedMovies,),
                  const SizedBox(height: 32),
              Text( "Malayalam Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24)),
             const SizedBox( height: 32,),
               MovieSlider(popularMovies: mainController.malayalamMovies,),
                const SizedBox(height: 32,),
               Text( "Popular Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24)),
               MovieSlider(popularMovies:mainController.popularMovies,),
               
            ],
          ),
        ),
      ),
       bottomNavigationBar: BottomNavigation(),
        drawer:  AppDrawer(),
    ); 
    
  }
}
