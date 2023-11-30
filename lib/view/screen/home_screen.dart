import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _fabBottomPosition = 16.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.blue,
                    height: media.height * 0.07,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0, right: 150),
                          child: Image.asset(
                            'assets/img/logo.png',
                            height: media.height * 0.044,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.notifications),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/Konten.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/Konten.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/Konten.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 190.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 10),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/Frame.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 183.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: Text(
                        'Ayo tukar kupon diskon!',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 150.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          width: 280.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/Kupon${index + 1}.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 15),
                      child: Row(
                        children: [
                          Text(
                            'Rekomendasi Artikel',
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'Lihat Semua',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(
                        4,
                        (index) {
                          List<String> itemTexts = [
                            'Mengenal Mental Health Lebih Dalam',
                            '5 Cara Menghilangkan Grogi Depan Umum',
                            'Penyebab Impulse Buying Dan Cara Mengatasinya',
                            'Tips Mengatasi Cemas yang Berlebihan'
                          ];

                          return Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/img/cover${index + 1}.png',
                                    width: 180,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    itemTexts[index],
                                    style: GoogleFonts.montserrat(fontSize: 13),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              right: 16,
              bottom: _fabBottomPosition,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/img/chatbot.png'),
                    ),
                  ),
                  child: Center(
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
