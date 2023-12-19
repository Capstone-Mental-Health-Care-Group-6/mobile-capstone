// article_detail_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String date;
  final String category;
  final String content;

  const ArticleDetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.category,
    required this.content,
    String? titleParagraf,
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
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                            text: 'Ditinjau oleh',
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: ' Udin',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.w300)),
                        TextSpan(
                            text: ' | $date | 7 menit',
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
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
