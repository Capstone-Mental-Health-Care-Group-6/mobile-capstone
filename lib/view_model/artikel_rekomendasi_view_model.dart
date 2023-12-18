import 'package:dio/dio.dart';
import 'package:empathi_care/model/article_model.dart';
import 'package:flutter/foundation.dart';

class ArticleProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  List<Article> _articles = [];

  List<Article> get articles => _articles;

  Future<void> fetchArticleslimit() async {
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

  Future<void> fetchArticles() async {
    try {
      final response = await _dio.get('https://kmb5alta.online/articles');
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

  Future<List<Article>> searchArticles(String query) async {
    try {
      final response =
          await _dio.get('https://kmb5alta.online/articles?q=$query');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'];
        return data.map((article) => Article.fromJson(article)).toList();
      } else {
        // Handle error
        print('Failed to load data');
        return [];
      }
    } catch (error) {
      // Handle exception
      print('Error: $error');
      return [];
    }
  }
}
