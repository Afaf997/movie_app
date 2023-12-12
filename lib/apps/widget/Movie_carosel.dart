import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late final PageController _pageController;
  late Timer _timer; 
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    startAutoScroll();
  }

  void startAutoScroll(){
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        if (_currentPage < widget.data.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(() => SizedBox(
          width: size.width,
          height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
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
              return GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  Get.toNamed('/tv/${widget.data[index].id}');
                },
                child: LandingCard(
                  image: CachedNetworkImageProvider(
                    "https://image.tmdb.org/t/p/original$url",
                  ),
                  name: widget.data[index].name.toString(),
                ),
              );
            },
          ),
        ));
  }
}