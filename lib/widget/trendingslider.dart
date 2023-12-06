import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_app/moviesDocument/controller/maincontroller.dart';

class TrendingSlides extends StatelessWidget {
 TrendingSlides({super.key});
 

         final controller = Get.put(MainController()); 

  @override
  Widget build(BuildContext context) {

    return   FutureBuilder(future: controller.topRatedMovie,
builder: (context, snapshot){
if(snapshot.hasData){
  return SizedBox(width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount:10, 
                  options:CarouselOptions(
                    height: 300,autoPlay: true,
                    viewportFraction: 0.55,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                  itemBuilder:(context,itemIndex, pageViewIndex){
                    return ClipRRect(
                      borderRadius:BorderRadius.circular(12) ,
                      child: Container(
                        height: 300,
                        width: 200,
                        color: const Color.fromARGB(255, 156, 37, 28),
                      ),
                    );
                  } ,
                  ),);
}else{
  return Text("no data");
}
},
      
    );
  }
}