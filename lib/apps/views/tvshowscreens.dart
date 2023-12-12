// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/apps/controller/favoriteController.dart';
import 'package:movie_app/apps/controller/maincontroller.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/services/dio_Service.dart';
import 'package:movie_app/apps/views/loding.dart';
import 'package:movie_app/apps/widget/movieTrailer.dart';
import 'package:movie_app/apps/widget/movieslider.dart';
import 'package:movie_app/apps/widget/overviewbox.dart';
import 'package:movie_app/apps/widget/textContainer.dart';
import 'package:movie_app/apps/widget/title_text.dart';
import 'package:movie_app/utils/consts.dart';
import 'package:url_launcher/url_launcher.dart';

class TVShowScreen extends StatefulWidget {
  const TVShowScreen(this.movieId, {super.key});
  final String movieId;

  @override
  State<TVShowScreen> createState() => _TVShowScreenState();
}

class _TVShowScreenState extends State<TVShowScreen> {
  WishlistController wishlistController = Get.put(WishlistController());
  final MainController mainController = Get.put(MainController());
  bool isLoading = true;
  late List<TvShow> recommendedTvShows;
  Future<void> playTrailer(BuildContext context, String trailerLink) async {
    try {
      if (await canLaunch(trailerLink)) {
        await launch(trailerLink);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the trailer link.'),
          ),
        );
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<void> fetchData() async {
    recommendedTvShows = await ApiCall().getRecommendedTvShows(widget.movieId);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background_primary,
      body: isLoading
          ? const LoadingScreen()
          : FutureBuilder(
              future: ApiCall().getTvShowDetail(widget.movieId),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var releaseDate = snapshot.data!.firstAirDate.toString();
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
                                              "assets/LoadingImage.png")
                                          as ImageProvider
                                      : NetworkImage(
                                          "https://image.tmdb.org/t/p/original${snapshot.data!.backdropPath}",
                                        ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            //.......................................
                            Container(
                              width: size.width,
                              margin: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(snapshot.data!.name.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: name),
                                      const SizedBox(
                                        width: 70,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ), //..........................
                                  FutureBuilder(
                                    future: ApiCall()
                                        .getMovieGeneres(widget.movieId, "tv"),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          height: 36,
                                          width: size.width,
                                          margin:
                                              const EdgeInsets.only(left: 8),
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
                                          const Color(
                                              0xFF14303B), // Default box color
                                          Colors.white, // Text color
                                        );
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
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
                            ), //............................................
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
                                              "tv")
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
                                        GestureDetector(
                                          onTap: () {
                                            if (wishlistController
                                                .isInWishlist(widget.movieId)) {
                                              wishlistController
                                                  .removeFromWishlist(
                                                      widget.movieId);
                                            } else {
                                              wishlistController.addToWishlist(
                                                  widget.movieId);
                                            }
                                            // Optional: Show a confirmation snackbar
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  wishlistController
                                                          .isInWishlist(
                                                              widget.movieId)
                                                      ? 'Added to Wishlist'
                                                      : 'Removed from Wishlist',
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (wishlistController
                                                      .isInWishlist(
                                                          widget.movieId)) {
                                                    wishlistController
                                                        .removeFromWishlist(
                                                            widget.movieId);
                                                  } else {
                                                    wishlistController
                                                        .addToWishlist(
                                                            widget.movieId);
                                                  }
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        wishlistController
                                                                .isInWishlist(
                                                                    widget
                                                                        .movieId)
                                                            ? 'Added to Wishlist'
                                                            : 'Removed from Wishlist',
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        if (wishlistController
                                                            .isInWishlist(widget
                                                                .movieId)) {
                                                          wishlistController
                                                              .removeFromWishlist(
                                                                  widget
                                                                      .movieId);
                                                        } else {
                                                          wishlistController
                                                              .addToWishlist(
                                                                  widget
                                                                      .movieId);
                                                        }
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            wishlistController
                                                                    .isInWishlist(
                                                                        widget
                                                                            .movieId)
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_border,
                                                            color: Colors.white,
                                                            size: 23,
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                         const Text(
                                                            'Wishlist',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                            ), //...................................................
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: textOverview(
                                "Overview",
                                EdgeInsets.all(8.0),
                                Color.fromARGB(255, 5, 28, 46),
                                Colors.white,
                              ),
                            ),
                            titleText(
                              snapshot.data!.overview.toString().isEmpty ||
                                      snapshot.data!.overview.toString() ==
                                          "null"
                                  ? "No overview available"
                                  : snapshot.data!.overview.toString(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: textOverview(
                                    "Recomented videos",
                                    EdgeInsets.all(8.0),
                                    Color.fromARGB(255, 5, 28, 46),
                                    Colors.white,
                                  ),
                                ),
                                // ignore: unnecessary_null_comparison
                                recommendedTvShows != null &&
                                        recommendedTvShows.isNotEmpty
                                    ? CustomListTv(data: recommendedTvShows)
                                    : const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'No recommendations available....',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        )
                      ]);
                } else {
                  return const LoadingScreen();
                }
              },
            ),
    );
  }
}
