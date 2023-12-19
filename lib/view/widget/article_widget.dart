// article_widget.dart

import 'package:empathi_care/model/article_model.dart';
import 'package:empathi_care/view/screen/article/artikel_detail_screen.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({
    super.key,
    required this.article,
  });

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailPage(
          title: article.title,
          date: '17 Oktober 2023',
          imagePath: article.thumbnail,
          category: article.categoryName,
          content: article.content,
          userName: article.userName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToDetail(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(article.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Text(
                          article.categoryName,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '17 Oktober 2023',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.black26,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
