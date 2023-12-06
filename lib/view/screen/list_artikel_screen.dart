import 'package:flutter/material.dart';

class AllArticlesPage extends StatelessWidget {
  const AllArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: _buildSearchBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDividerSearchArtikel(),
          _buildGenreCarousel(),
          _buildArticleList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Container(
                height: 40,
                padding: const EdgeInsets.only(top: 18, left: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12)),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Cari artikel...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGenreCarousel() {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildGenreItem('Semua'),
          _buildGenreItem('Stress'),
          _buildGenreItem('Anxiety'),
          _buildGenreItem('Depresi'),
          _buildGenreItem('Kesehatan'),
        ],
      ),
    );
  }

  Widget _buildGenreItem(String genre) {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 0, bottom: 10, left: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          genre,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    );
  }

  Widget _buildArticleList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildArticleListItem(
                  'Title 1', 'assets/img/article.png', '13 Oktober 2023'),
              _buildDivider(),
              _buildArticleListItem(
                  'Title 2', 'assets/img/article.png', '14 Oktober 2023'),
              _buildDivider(),
              _buildArticleListItem(
                  'Title 3', 'assets/img/article.png', '15 Oktober 2023'),
              _buildDivider(),
              _buildArticleListItem(
                  'Title 3', 'assets/img/article.png', '15 Oktober 2023'),
              _buildDivider(),
              _buildArticleListItem(
                  'Title 3', 'assets/img/article.png', '15 Oktober 2023'),
              _buildDivider(),
              _buildArticleListItem(
                  'Title 3', 'assets/img/article.png', '15 Oktober 2023'),
              _buildDivider(),
              _buildArticleListItem(
                  'Title 3', 'assets/img/article.png', '15 Oktober 2023'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleListItem(String title, String imagePath, String date) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
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
              ),
              const SizedBox(height: 8),
              Text(
                date,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      height: 1,
      color: Colors.grey,
    );
  }
}

Widget _buildDividerSearchArtikel() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    height: 1,
    color: Colors.grey,
  );
}
