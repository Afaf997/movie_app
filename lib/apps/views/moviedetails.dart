import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/apps/controller/favoriteController.dart';
import 'package:movie_app/apps/controller/maincontroller.dart';
import 'package:movie_app/apps/model/moviesModel.dart';
import 'package:movie_app/apps/services/dio_Service.dart';
import 'package:movie_app/apps/views/loding.dart';
import 'package:movie_app/apps/widget/movieTrailer.dart';
import 'package:movie_app/apps/widget/overviewbox.dart';
import 'package:movie_app/apps/widget/textContainer.dart';
import 'package:movie_app/apps/widget/title_text.dart';
import 'package:movie_app/utils/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieScreen extends StatefulWidget {
  final String movieId;

  const MovieScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final MainController mainController = Get.put(MainController());
  WishlistController wishlistController = Get.put(WishlistController());
  bool isLoading = true;
  late List<Results> recommendedMovies;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      recommendedMovies = await ApiCall().getRecommendedMovie(widget.movieId);
    } catch (e) {
      log('Error fetching recommended movies: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> playTrailer(BuildContext context, String trailerLink) async {
    try {
      // ignore: deprecated_member_use
      if (await canLaunch(trailerLink)) {
        // ignore: deprecated_member_use
        await launch(trailerLink);
      } else {
        Get.snackbar(
          'Error',
          'Could not open the trailer link.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background_primary,
      appBar: AppBar(
        title: Text(
          'Movie Details',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: true,
      ),
      body: isLoading
          ? const LoadingScreen()
          : FutureBuilder(
              future: ApiCall().getMovieDetail(widget.movieId),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var releaseDate =
                      snapshot.data!.releaseDate?.toString() ?? '';
                  return ListView(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: size.width,
                            height: size.height * 0.40 > 300
                                ? size.height * 0.40
                                : 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: snapshot.data!.backdropPath == null
                                    ? const AssetImage(
                                            'assets/LoadingImage.png')
                                        as ImageProvider
                                    : NetworkImage(
                                        "https://image.tmdb.org/t/p/original${snapshot.data!.backdropPath}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            margin: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  snapshot.data!.title.toString(),
                                  style: name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                FutureBuilder(
                                  future: ApiCall()
                                      .getMovieGeneres(widget.movieId, 'movie'),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      return Container(
                                        height: 36,
                                        width: size.width,
                                        margin: const EdgeInsets.only(left: 8),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return textContainer(
                                              snapshot.data![index].name
                                                  .toString(),
                                              const EdgeInsets.only(right: 8),
                                              Colors.black,
                                              Colors.white,
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      return textContainer(
                                        "Loading",
                                        const EdgeInsets.all(8),
                                        const Color(0xFF14303B),
                                        Colors.white,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, bottom: 8),
                                      child: Text(
                                        'Release : ${DateFormat.yMMMMd().format(DateTime.parse(releaseDate))}',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 119, 119, 119),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Positioned(
                                child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    HapticFeedback.lightImpact();
                                    ApiCall()
                                        .getTrailerLink(
                                            snapshot.data!.id.toString(),
                                            "movie")
                                        .then((value) =>
                                            playTrailer(context, value));
                                  },
                                  child: const PlayButton(),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Trailer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                GestureDetector(
                                  onTap: () {
                                    if (wishlistController
                                        .isInWishlist(widget.movieId)) {
                                      wishlistController
                                          .removeFromWishlist(widget.movieId);
                                    } else {
                                      wishlistController
                                          .addToWishlist(widget.movieId);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        wishlistController
                                                .isInWishlist(widget.movieId)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.white,
                                        size: 23,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Wishlist',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Text(
                                  snapshot.data!.voteAverage
                                      .toString()
                                      .substring(0, 3),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                              ],
                            )),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: textOverview(
                              "overview",
                              EdgeInsets.all(8.0),
                              const Color.fromARGB(255, 6, 29, 47),
                              Colors.white,
                            ),
                          ),
                          titleText(
                            snapshot.data!.overview.toString().isEmpty ||
                                    snapshot.data!.overview.toString() == 'null'
                                ? 'No overview available :('
                                : snapshot.data!.overview.toString(),
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //   textOverview('Recommendations', EdgeInsets.all(
                          //               8.0),
                          //           const Color.fromARGB(255, 6, 29, 47),
                          //           Colors
                          //               .white, ),
                          //     // ignore: unnecessary_null_comparison
                          //     recommendedMovies != null &&
                          //             recommendedMovies.isNotEmpty
                          //         ? MovieSlider(
                          //             popularMovies: recommendedMovies)
                          //         : const Padding(
                          //             padding: EdgeInsets.all(8.0),
                          //             child: Text(
                          //               'No recommendations available....',
                          //               style: noRecom,
                          //             ),
                          //           ),
                          //   ],
                          // ),
                        ],
                      )
                    ],
                  );
                }
                return const LoadingScreen();
              },
            ),
    );
  }
}
