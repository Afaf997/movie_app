import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/controller/favoriteController.dart';
import 'package:movie_app/apps/services/dio_Service.dart';
import 'package:movie_app/apps/views/loding.dart';
import 'package:movie_app/utils/consts.dart';

class WishlistPage extends StatelessWidget {
  final WishlistController wishlistController = Get.put(WishlistController());

  WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: backgroundPrimary,
        elevation: 0,
        title: Text(
          "Favorite Lists".toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
      backgroundColor: background_primary,
      body: Obx(
        () {
          if (wishlistController.wishlist.isEmpty) {
            return const Center(
              child: Text(
                'Wishlist is empty',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            );
          } else {
   
            return ListView.builder(
              itemCount: wishlistController.wishlist.length,
              itemBuilder: (context, index) {
                String movieId = wishlistController.wishlist.elementAt(index);

                return FutureBuilder(
                  future: ApiCall().getMovieDetail(movieId),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      var title = snapshot.data!.title?.toString() ?? '';
                      var backdropPath = snapshot.data!.backdropPath?.toString() ?? '';
                      var overview = snapshot.data!.overview?.toString() ?? '';

                      return Dismissible(
                        key: Key(movieId),
                        onDismissed: (direction) {
                          _handleItemDelete(movieId);
                        },
                        background: Container(
                          color: Colors.white,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16),
                          child: const Icon(Icons.delete, color: Colors.black),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            _handleItemTap(movieId);
                          },
                          child: Card(
                            color: const Color.fromARGB(100, 22, 44, 33),
                            child: ListTile(
                              title: Text(title, style: noRecom),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    "https://image.tmdb.org/t/p/original$backdropPath",
                                    height: 100, // Adjust the height as needed
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Overview: $overview',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'Backdrop Path: $backdropPath',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const LoadingScreen();
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  void _handleItemTap(String movieId) {
    Get.toNamed('/movie/$movieId');
  }

  void _handleItemDelete(String movieId) {
    wishlistController.removeFromWishlist(movieId);
  }
}