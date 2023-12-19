import 'package:dio/dio.dart';
import 'package:empathi_care/model/article_model.dart';
import 'package:flutter/foundation.dart';

class ArticleHomeProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchArticleslimit() async {
    try {
      final response =
          await _dio.get('https://kmb5alta.online/articles?limit4');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        _articles = data.map((article) => Article.fromJson(article)).toList();
        notifyListeners();
      } else {
        // Handle error
      }
    } catch (error) {
      // Handle exception
    }
  }
}
