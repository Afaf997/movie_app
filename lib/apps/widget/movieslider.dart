// import 'package:cached_network_image/cached_network_image.dart';
 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/model/moviesModel.dart';
import 'package:movie_app/apps/widget/movieCard.dart';


class MovieSlider extends StatefulWidget {
  final List<Results> popularMovies;
  const MovieSlider({super.key, this.popularMovies = const []});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(()=>
    SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount:
              widget.popularMovies.length > 20 ? 20 : widget.popularMovies.length,
          // cacheExtent: 9999,
          itemBuilder: (context, index) {
            var url = widget.popularMovies[index].posterPath.toString();
            return KeyedSubtree(
                key: UniqueKey(),
                child: MovieCard(
                  mediaType: 'movie',
                  id: widget.popularMovies[index].id.toString(),
                  title: widget.popularMovies[index].title.toString(),
                  image: CachedNetworkImageProvider(
                      "https://image.tmdb.org/t/p/w500$url"),
                ));
          },
        ),
      ),
    );
  }
}

class CustomListTv extends StatefulWidget {
  final List<TvShow> data;
  const CustomListTv({super.key, required this.data});

  @override
  State<CustomListTv> createState() => _CustomListTvState();
}

class _CustomListTvState extends State<CustomListTv>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length > 20 ? 20 : widget.data.length,
        itemBuilder: (context, index) {
          var url = widget.data[index].posterPath.toString();
          return KeyedSubtree(
            key: UniqueKey(),
            child: MovieCard(
              mediaType: 'tv',
              id: widget.data[index].id.toString(),
              title: widget.data[index].name.toString(),
              image: NetworkImage("https://image.tmdb.org/t/p/w500$url"),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}