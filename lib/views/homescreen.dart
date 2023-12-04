import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/views/searchpage.dart';
import 'package:movie_app/widget/movieslider.dart';
import 'package:movie_app/widget/trendingslider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/movie1.avif',
          fit: BoxFit.cover,
          height: 40,
          width: 180,
          filterQuality: FilterQuality.high,
        ),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>const MovieSearch()));},
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
              Text( "Trending Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24),
              ),
              const SizedBox( height: 32,
              ),
             const TrendingSlides(),
              const SizedBox( height: 32,
              ),
              Text( "Top rated Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24),
              ),
             const SizedBox( height: 32,
              ),
              const MovieSlider(),
              const SizedBox(height: 32,
              ),
              Text( "Upcoming Movies",
                style: GoogleFonts.aBeeZee(fontSize: 24),
              ),
             const SizedBox( height: 32,
              ),
              const MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
