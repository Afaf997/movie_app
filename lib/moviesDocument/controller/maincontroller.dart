import 'dart:developer';
import 'package:get/get.dart';
import 'package:movie_app/moviesDocument/Services/dio_Service.dart';
import 'package:movie_app/moviesDocument/model/moviesModel.dart';


class MainController extends GetxController {
  var isVisible = true.obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;
   var trendingMovies = <Results>[].obs;
  // final futureArticles = <Article>[].obs;
  RxSet<String> wishlist = <String>{}.obs;

  var popularMovies = <Results>[].obs;
  var animatedMovies = <Results>[].obs;
  var malayalamMovies = <Results>[].obs;
  var topRatedMovie = <Results>[].obs;
 

  @override
  void onInit() {
    super.onInit();
    fetchData();
    // fetchArticles();
  }
  // Check if a movie/show is in the wishlist
  bool isInWishlist(String movieId) => wishlist.contains(movieId);

  // Add to wishlist
  void addToWishlist(String movieId) {
    if (!wishlist.contains(movieId)) {
      wishlist.add(movieId);
      update(); // Notify listeners about the change
    }
  }

  // Remove from wishlist
  void removeFromWishlist(String movieId) {
    wishlist.remove(movieId);
    update(); // Notify listeners about the change
  }

  Future<void> fetchData() async {
    // topRatedShows.value = await ApiCall().getTopRatedShow();
    malayalamMovies.value = await ApiCall().getMalayamLanguage();
    popularMovies.value = await ApiCall().popularMovies();
    // topRatedMovie.value = await ApiCall().getTopRatedMovie();
    // popularShows.value = await ApiCall().getRecommendedTvShows('1396');
    // nowPLayingMovie.value = await ApiCall().getNowPLayingMovie();
    // animatedMovies.value = await ApiCall().getAnimated();

    isLoading.value = false;
  }

  void onTap(int index) {
    currentIndex.value = index;
  }

  // Future<void> fetchArticles() async {
  //   try {
  //     var articles = await NewsService().getEntertainmentNews();
  //     futureArticles.assignAll(articles);
  //   } catch (error) {
  //     log('Error fetching articles: $error');
  //   }
  }
  
// }