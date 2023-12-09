import 'package:empathi_care/view/screen/Home/routes_navigator.dart';
import 'package:empathi_care/view/screen/chat_history_screen.dart';
import 'package:empathi_care/view/widget/invoice_rating_widget.dart';
import 'package:empathi_care/view/widget/rating_dialog.dart';
import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({super.key});

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  List<int> starsRating = [1, 2, 3, 4, 5];
  bool isReviewed = false;

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Pemesanan',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
              
        ),
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              child: Image.asset(
                'assets/images/chat-without-bg.png',
                width: 25,
              ),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const ChatHistoryScreen())),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const InvoiceHeader(),
            const SizedBox(height: 30),
            Column(
              children: [
                Text('Bagaimana dengan Psikolog?',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 3),
                Text('(1 adalah mengecewakan, 5 adalah terbaik)',
                    style: GoogleFonts.montserrat(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 15),
                isReviewed
                    ? SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: starsRating
                              .map((_) => SvgPicture.asset(
                                    'assets/icons/star.svg',
                                    width: 20,
                                  ))
                              .toList(),
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      ),
              ],
            ),
            isReviewed ? const SizedBox(height: 30) : const SizedBox(),
            const InvoiceRatingWidget()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            !isReviewed
                ? SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(
                            0xFF0085FF), //change background color of button
                        side: const BorderSide(color: Color(0xFF0085FF)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const RatingDialog();
                          },
                        );
                        setState(() {
                          isReviewed = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          'Beri Ulasan',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      Colors.white, //change background color of button
                  backgroundColor:
                      const Color(0xFF0085FF), //change text color of button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Pesan Lagi',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ),
              ),
              elevation: 15.0),
          onPressed: () {
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const RoutesScreen()), (route) => false);
                      navigationProvider.setIndex(1);
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              'Beli Lagi',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo-empathi-care.png',
              width: 140,
            ),
            Text(
              'Monday, 23 Oktober, 10:00',
              style: GoogleFonts.montserrat(fontSize: 12),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Konseling Instan',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w600)),
            Text('Order 100000000000001',
                style: GoogleFonts.montserrat(fontSize: 12))
          ],
        )
      ],
    );
  }
}
