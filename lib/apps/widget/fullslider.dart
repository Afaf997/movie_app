

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/model/moviesModel.dart';
import 'package:movie_app/apps/widget/fullCard.dart';


class FullSlider extends StatefulWidget {
  final List<Results> popularMovies;
  const FullSlider({super.key, this.popularMovies = const []});

  @override
  State<FullSlider> createState() => _FullSliderState();
}

class _FullSliderState extends State<FullSlider>
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
          // cacheExtent: 99,
          itemBuilder: (context, index) {
            var url = widget.popularMovies[index].posterPath.toString();
            return KeyedSubtree(
                key: UniqueKey(),
                child:FullCard(
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

class CustomList extends StatefulWidget {
  final List<TvShow> data;
  const CustomList({super.key, required this.data});

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList>
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
            child: FullCard(
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