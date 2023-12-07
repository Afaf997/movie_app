
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/widget/landingcard.dart';


class CustomCarouselSlider extends StatefulWidget {
  final List<TvShow> data;

  const CustomCarouselSlider({Key? key, required this.data}) : super(key: key);

  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(()=>
       SizedBox(
        width: size.width,
        height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
        child: CarouselSlider.builder(

           options:CarouselOptions(
                    height: 300,autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
          itemCount: widget.data.length,
               itemBuilder: (context, index, pageViewIndex) {
              if (index < 0 || index >= widget.data.length) {
                return Container();
              }

              var url = widget.data[index].backdropPath.toString();
              return LandingCard(
                image: CachedNetworkImageProvider(
                  "https://image.tmdb.org/t/p/original$url",
                ),
                name: widget.data[index].name.toString(),
              );
            },
    
        ),
      ),
    );
  }
}

