import 'package:flutter/material.dart';
import 'package:movie_app/utils/consts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: background_primary,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}