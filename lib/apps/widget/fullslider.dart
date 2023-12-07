import 'package:flutter/material.dart';
import 'package:movie_app/apps/model/moviesModel.dart';

class FullSlider extends StatelessWidget {
  final List<Results> popularMovies;
  const FullSlider({super.key, required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
           
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: const Color.fromARGB(255, 156, 37, 28),
                  height: 200,
                  width: 260,
                ),
              ),
            );
          }),
    );
  }
}
