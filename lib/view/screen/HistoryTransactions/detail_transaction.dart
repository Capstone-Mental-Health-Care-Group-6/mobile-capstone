import 'package:empathi_care/view/screen/Home/routes_navigator.dart';
import 'package:empathi_care/view/screen/chat_history_screen.dart';
import 'package:empathi_care/view/widget/invoice_rating_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Pemesanan',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
              
        ),
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              child: Image.asset('assets/images/chat-with-bg.png'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ChatHistoryScreen())),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          // shrinkWrap: true,
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
                SizedBox(
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
              ],
            ),
            const SizedBox(height: 30),
            const InvoiceRatingWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, //change background color of button
              backgroundColor:
                  const Color(0xFF0085FF), //change text color of button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
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
          ),
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
            Image.asset('assets/images/logo-with-text.png'),
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
