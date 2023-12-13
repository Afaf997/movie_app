import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/model/searchModel.dart';
import 'package:movie_app/apps/widget/search_card.dart';

class SearchList extends StatelessWidget {
  final ScrollController scrollController;
  final Future<List<SearchResult>> future;
  const SearchList(
      {super.key, required this.scrollController, required this.future});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: size.height * 0.8,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              scrollDirection: Axis.vertical,
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (snapshot.data![index].mediaType == 'movie') {
                  var url = snapshot.data![index].posterPath;
                  return GestureDetector(
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      Get.toNamed('/movie/${snapshot.data![index].id}');
                    },
                    child: SearchCard(
                      title: snapshot.data![index].title.toString(),
                      image: url == null
                          ? const AssetImage("assets/LoadingImage.png")
                          : CachedNetworkImageProvider(
                                  "https://image.tmdb.org/t/p/original$url")
                              as ImageProvider,
                      popularRating:
                          snapshot.data![index].voteAverage.toString(),
                      mediaType: 'movie',
                    ),
                  );
                } else {
                  return const SearchCard(
                    title: 'Loading',
                    image: AssetImage('assets/LoadingImage.png'),
                    popularRating: '0',
                    mediaType: 'N/A',
                  );
                }
              },
            ),
          );
        } else {
          return const SearchCard(
            title: 'Loading',
            image: AssetImage('assets/LoadingImage.png'),
            popularRating: '0',
            mediaType: 'N/A',
          );
        }
      },
    );
  }
}
