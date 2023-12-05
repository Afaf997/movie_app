import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key});

  @override
  Widget build(BuildContext context) {
    bool itemsAvailable = false;

    return Scaffold(
      appBar: AppBar(
        
        title: Text('Favorites'),
      ),
      body: itemsAvailable
          ? ListView(
          
              children: [
           
              ],
            )
          : Center(
               child: Lottie.asset(
                     'assets/animation/empty.json',
                     fit: BoxFit.cover,
                   ),
            ),
    );
  }
}