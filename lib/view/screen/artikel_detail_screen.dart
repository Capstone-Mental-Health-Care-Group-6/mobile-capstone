// article_detail_page.dart

import 'package:empathi_care/view/screen/list_artikel_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String date;
  final String category;
  final String content;
  final String userName;

  const ArticleDetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.category,
    required this.content,
    String? titleParagraf,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Artikel',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "Ditinjau oleh",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(userName,
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "| $date | 7 menit",
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 8),
                  SizedBox(
                      width: 350,
                      height: 180,
                      child: Center(
                        child: Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(height: 8),
                  HtmlWidget(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
