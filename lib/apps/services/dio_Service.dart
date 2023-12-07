import 'package:dio/dio.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/model/moviesModel.dart';

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

    Future<List<Results>> getMalayamLanguage() async {
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/discover/movie?$apiKey&with_original_language=ml';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
      print("data recievd");
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

}