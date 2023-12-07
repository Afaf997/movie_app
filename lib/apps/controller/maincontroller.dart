
import 'package:get/get.dart';
import 'package:movie_app/apps/services/dio_Service.dart';
import 'package:movie_app/apps/model/TvShow.dart';
import 'package:movie_app/apps/model/moviesModel.dart';


class MainController extends GetxController {
  var isVisible = true.obs;
  var isLoading = true.obs;
  var currentIndex = 0.obs;
   var trendingMovies = <Results>[].obs;
  // final futureArticles = <Article>[].obs;
  

  var popularMovies = <Results>[].obs;
  var animatedMovies = <Results>[].obs;
  var malayalamMovies = <Results>[].obs;
  var topRatedMovie = <Results>[].obs;
  var topRatedShows = <TvShow>[].obs;
  var popularShows = <TvShow>[].obs;
 

  @override
  void onInit() {
    super.onInit();
    fetchData();
    // fetchArticles();
  }

  Future<void> fetchData() async {
     topRatedShows.value = await ApiCall().getTopRatedShow();
    malayalamMovies.value = await ApiCall().getMalayamLanguage();
    popularMovies.value = await ApiCall().popularMovies();
    // topRatedMovie.value = await ApiCall().getTopRatedMovie();
     popularShows.value = await ApiCall().getRecommendedTvShows('1396');
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