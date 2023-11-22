import 'package:carousel_slider/carousel_slider.dart';
import 'package:empathi_care/view/widget/card_review.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselReviews extends StatefulWidget {
  const CarouselReviews({super.key});

  @override
  State<CarouselReviews> createState() => _CarouselReviewsState();
}

class _CarouselReviewsState extends State<CarouselReviews> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<int> reviewers = [1, 2, 3, 4];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
            Wrap(
              spacing: 5,
              children: [
                InkWell(
                    child: const Icon(Icons.chevron_left),
                    onTap: () => _controller.previousPage()),
                InkWell(
                  child: const Icon(Icons.chevron_right),
                  onTap: () => _controller.nextPage(),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        CarouselSlider(
          items: reviewers.map((_) => const CardReview()).toList(),
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 18 / 8,
            viewportFraction: 1,
          ),
          carouselController: _controller,
        ),
      ],
    );
  }
}
