import 'package:empathi_care/view/widget/article_widget.dart';
import 'package:empathi_care/view_model/artikel_rekomendasi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllArticlesPage extends StatefulWidget {
  const AllArticlesPage({super.key});

  @override
  AllArticlesPageState createState() => AllArticlesPageState();
}

class AllArticlesPageState extends State<AllArticlesPage> {
  final TextEditingController controller = TextEditingController();
  List<String> categories = [
    'Semua',
    'Stress',
    'Anxiety',
    'Depresi',
    'Kesehatan'
  ];
  String selectedCategory = 'Semua';
  void updateSelectedCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        build(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ArticleProvider>(context, listen: false).fetchArticles();
  }

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
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearch());
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  bool isSelected = category == selectedCategory;
                  return GestureDetector(
                    onTap: () => updateSelectedCategory(category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      margin:
                          const EdgeInsets.only(left: 30, top: 10, bottom: 15),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.blue : const Color(0xFFCCE7FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ArticleProvider>(
              builder: (context, articleProvider, child) {
                return ListView.builder(
                  itemCount: articleProvider.articles.length,
                  itemBuilder: (context, index) {
                    var article = articleProvider.articles[index];
                    return ArticleWidget(article: article);
                  },
                );
              },
            ),
          ),
        ]));
  }
}

class CustomSearch extends SearchDelegate {
  List<String> categories = [
    'Semua',
    'Stress',
    'Anxiety',
    'Depresi',
    'Kesehatan'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    if (query.isNotEmpty) {
      for (var item in categories) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          matchQuery.add(item);
        }
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      },
      itemCount: matchQuery.length,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }
}