import 'package:empathi_care/view/screen/artikel_detail_screen.dart';
import 'package:empathi_care/view/screen/chat_bot_ai_screen.dart';
import 'package:empathi_care/view/screen/list_artikel_screen.dart';
import 'package:empathi_care/view/screen/notification_screen.dart';
import 'package:empathi_care/view_model/artikel_home.dart';
import 'package:empathi_care/view_model/artikel_list_view.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _fabBottomPosition = 16.0;
  @override
  void initState() {
    super.initState();
    Provider.of<ArticleHomeProvider>(context, listen: false)
        .fetchArticleslimit();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 3.55;
    // final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.blue,
        leadingWidth: 160,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Image.asset(
            'assets/images/Logo.png',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NotificationScreen()));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Konten.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Konten.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Konten.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 190.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Frame.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 183.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 15),
                    child: Text(
                      'Ayo tukar kupon diskon!',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5),
                          width: 280.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/Kupon${index + 1}.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, left: 15),
                    child: Row(
                      children: [
                        Text(
                          'Rekomendasi Artikel',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const AllArticlesPage()));
                            },
                            child: Text(
                              'Lihat Semua',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Consumer<ArticleHomeProvider>(
                    builder: (context, articleProvider, child) {
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: articleProvider.articles.map((article) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage(
                                    title: article.title,
                                    imagePath: article.thumbnail,
                                    date: '17 Oktober 2019',
                                    category: article.categoryName,
                                    content: article.content,
                                    userName: article.userName,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 10,
                                    blurRadius: 12,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    child: Image.network(
                                      article.thumbnail,
                                      width: 120,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    height: 60,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 11),
                                          child: Text(
                                            article.title,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  )
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              right: 16,
              bottom: _fabBottomPosition,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ChatAIScreen()));
                },
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/chatbot_home.png'),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
