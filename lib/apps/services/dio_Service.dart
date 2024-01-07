import 'package:dio/dio.dart';
import 'package:movie_app/apps/model/MovieDetail.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/model/TvShowDetail.dart';
import 'package:movie_app/apps/model/moviesModel.dart';
import 'package:movie_app/apps/model/searchModel.dart';
import 'package:movie_app/apps/model/trailer.dart';

class ApiCall{
  final Dio dio=Dio();
  final String mainUrl = 'https://api.themoviedb.org/3';
  final String apiKey = 'api_key=94755d65f500af1c6668340edf3bb708';
  
  Future<List<Results>>popularMovies()async{
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/movie/popular?$apiKey&page=1';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      print("data recievd");
      return movieList;
      
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
   }
    Future<List<Results>> getMalayalamLanguage() async {
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/discover/movie?$apiKey&with_original_language=ml';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      print("data malayalam");
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }

   Future<List<TvShow>> getPopularShow() async {
    try {
      List<TvShow> showsList = [];
      final url = '$mainUrl/tv/popular?$apiKey&page=1';
      final response = await dio.get(url);
      var shows = response.data['results'] as List;
      showsList = shows.map((m) => TvShow.fromJson(m)).toList();
      print("data recievd");
      return showsList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Results>> getRecommendedMovie(String movieId) async {
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/movie/$movieId/recommendations?$apiKey&page=1';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TvShow>> getTopRatedShow() async {
    try {
      List<TvShow> showsList = [];
      final url = '$mainUrl/tv/top_rated?$apiKey&page=1';
      final response = await dio.get(url);
      var shows = response.data['results'] as List;
      showsList = shows.map((m) => TvShow.fromJson(m)).toList();
      print("data recievd");
      return showsList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

    Future<List<Results>> getTopRatedMovie() async {
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/movie/top_rated?$apiKey&page=1';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<TvShow>> getRecommendedTvShows(String showId) async {
    try {
      List<TvShow> showList = [];
      final url = '$mainUrl/tv/$showId/recommendations?$apiKey&page=1';
      final response = await dio.get(url);
      var shows = response.data['results'] as List;
      showList = shows.map((m) => TvShow.fromJson(m)).toList();
      print("data recievd");
      return showList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

   Future<List<Results>> getAnimated() async {
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/discover/movie?$apiKey&with_genres=16';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }


  Future<MovieDetail> getMovieDetail(String movieId) async {
    try {
      final url = '$mainUrl/movie/$movieId?$apiKey';
      final response = await dio.get(url);
      MovieDetail movie = MovieDetail.fromJson(response.data);
      return movie;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Genres>> getMovieGeneres(String movieId, String mediaType) async {
    try {
      List<Genres> generesList = [];
      final url = '$mainUrl/$mediaType/$movieId?$apiKey';
      final response = await dio.get(url);
      var generes = response.data['genres'] as List;
      generesList = generes.map((m) => Genres.fromJson(m)).toList();
      return generesList;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }

  Future<List<Results>> getNowPLayingMovie() async {
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/movie/now_playing?$apiKey&page=1';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      return movieList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }



  Future<TvShowDetail> getTvShowDetail(String showId) async {
    try {
      final url = '$mainUrl/tv/$showId?$apiKey';
      final response = await dio.get(url);
      TvShowDetail show = TvShowDetail.fromJson(response.data);
      return show;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  // Search

  Future<List<SearchResult>> getSearchResult(searchQuery) async {
    if (searchQuery.toString().isEmpty) {
      return [];
    }
    try {
      final url = '$mainUrl/search/multi?$apiKey&query=$searchQuery';
      final response = await dio.get(url);
      var shows = response.data['results'] as List;
      List<SearchResult> showsList =
          shows.map((m) => SearchResult.fromJson(m)).toList();
      return showsList;
    } catch (error) {
      return [];
    }
  }

  // trailer Link
  
  Future<String> getTrailerLink(String movieId, String mediaType) async {
    try {
      final url = '$mainUrl/$mediaType/$movieId/videos?$apiKey';
      final response = await dio.get(url);
      var videos = response.data['results'] as List;
      List<VideoResults> videosList =
          videos.map((m) => VideoResults.fromJson(m)).toList();
      var trailerLink = 'dQw4w9WgXcQ'; 
      for (var i = 0; i < videosList.length; i++){
        if (videosList[i].site == 'YouTube' &&
            videosList[i].type == 'Trailer') {
          trailerLink = videosList[i].key.toString();
        }
      }
      return 'https://www.youtube.com/watch?v=$trailerLink';
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

}