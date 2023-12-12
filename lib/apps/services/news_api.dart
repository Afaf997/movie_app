import 'dart:convert';

import 'package:movie_app/apps/controller/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const String apiKey = 'api_key=2ef804ecf6ad4f1d83d65db2d1001798';
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';
  static const String category = 'entertainment';

  Future<List<Article>> getEntertainmentNews() async {
    final response = await http.get(
      Uri.parse('$baseUrl?country=in&category=$category&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 'ok') {
        final List<dynamic> articles = data['articles'];
        return articles.map((article) => Article.fromJson(article)).toList();
      }
    }

    throw Exception('Failed to load entertainment news');
  }
}
