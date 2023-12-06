import 'package:dio/dio.dart';
import 'package:movie_app/moviesDocument/model/moviesModel.dart';

class ApiCall{
  final Dio dio=Dio();
  final String mainUrl = 'https://api.themoviedb.org/3';
   final String apiKey = 'api_Key=94755d65f500af1c6668340edf3bb708';

   Future<List<Results>>popularMovies()async{
    try {
      List<Results> movieList = [];
      final url = '$mainUrl/movie/popular?$apiKey&page=1';
      final response = await dio.get(url);
      var movies = response.data['results'] as List;
      movieList = movies.map((m) => Results.fromJson(m)).toList();
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
      return movieList;
    } catch (error, stacktrace) {
      throw Exception('Exception occured: $error with stacktrace: $stacktrace');
    }
  }

}