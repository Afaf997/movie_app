// import 'package:get/get.dart';
// import 'package:movie_app/apps/model/moviesModel.dart';
// import 'package:movie_app/apps/services/dio_Service.dart';

// class RecommendedMoviesController extends GetxController {
//   var recommendedMovies = <Results>[].obs;

//   Future<void> fetchRecommendedMovies(String movieId) async {
//     try {
//       recommendedMovies.assignAll(await ApiCall().getRecommendedMovie(movieId));
//     } catch (e) {
//       // Handle the error
//       print('Error fetching recommended movies: $e');
//     }
//   }
// }