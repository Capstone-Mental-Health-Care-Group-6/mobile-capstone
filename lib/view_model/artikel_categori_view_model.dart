import 'package:dio/dio.dart';
import 'package:empathi_care/model/article_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<String> allCategories = [];
  List<Article> articles = [];

  Future<void> fetchCategoriesAndArticles() async {
    try {
      final response = await Dio().get('https://kmb5alta.online/articles');
      final data = response.data['data'];

      Set<String> uniqueCategories = <String>{};

      for (var item in data) {
        uniqueCategories.add(item['category_name']);
      }

      allCategories = List<String>.from(uniqueCategories);

      articles = List<Article>.from(data.map((item) => Article.fromJson(item)));

      notifyListeners();
    } catch (_) {}
  }

  List<Article> getArticlesByCategory(String selectedCategory) {
    return articles
        .where((article) => article.categoryName == selectedCategory)
        .toList();
  }

  void updateData(String selectedCategory) {
    notifyListeners();
  }
}
