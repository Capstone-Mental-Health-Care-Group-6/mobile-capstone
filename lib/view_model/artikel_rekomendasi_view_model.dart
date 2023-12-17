import 'package:dio/dio.dart';
import 'package:empathi_care/model/article_model.dart';
import 'package:flutter/foundation.dart';

class ArticleProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchArticles() async {
    try {
      final response =
          await _dio.get('https://kmb5alta.online/articles?limit=4');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        _articles = data.map((article) => Article.fromJson(article)).toList();
        notifyListeners();
      } else {
        // Handle error
        print('Failed to load data');
      }
    } catch (error) {
      // Handle exception
      print('Error: $error');
    }
  }
}