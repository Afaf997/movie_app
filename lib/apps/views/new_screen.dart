import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/apps/controller/maincontroller.dart';
import 'package:movie_app/apps/views/loding.dart';
import 'package:movie_app/apps/widget/news_screenModel.dart';
import 'package:movie_app/utils/consts.dart';

class NewsHomeScreen extends StatelessWidget {
  final MainController newsController = Get.put(MainController());

    NewsHomeScreen({super.key});

  Future<void> _refresh() async {
    await newsController.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      resizeToAvoidBottomInset: false,
      backgroundColor: background_primary,
        appBar: AppBar(
        title: Text('Movie News',style: TextStyle(fontWeight: FontWeight.w500),), 
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: Obx(
                    () => newsController.futureArticles.isEmpty
                        ? const LoadingScreen()
                        : _buildNewsList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsList() {
    return ListView.builder(
      itemCount: newsController.futureArticles.length,
      itemBuilder: (context, index) {
        final article = newsController.futureArticles[index];
        return Stack(
          children: [
            NewsCard(article: article),
          ],
        );
      },
    );
  }
}