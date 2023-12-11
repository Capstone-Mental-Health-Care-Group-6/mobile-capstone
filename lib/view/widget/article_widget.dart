// article_widget.dart

import 'package:empathi_care/view/screen/artikel_detail_screen.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String category;
  final String? titleParagraf;

  const ArticleWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.category,
    this.titleParagraf,
  });

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailPage(
          title: title,
          date: date,
          imagePath: imagePath,
          category: category,
          content:
              ' Good mental health atau kesehatan mental yang baik adalah kondisi ketika kejiwaan dan pikiran dalam keadaan tenang dan damai. Kondisi ini memungkinkan seseorang untuk berpikir lebih jernih dan fokus saat beraktivitas. Sama halnya dengan kesehatan fisik, kesehatan mental juga penting untuk dijaga. ',
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
                      image: AssetImage(imagePath),
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
                        title,
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
                          category,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        date,
                        style: const TextStyle(color: Colors.grey),
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
