import 'package:empathi_care/model/detail_history_transaction_model.dart';
import 'package:empathi_care/view/screen/Home/routes_navigator.dart';
import 'package:empathi_care/view/screen/chat_history_screen.dart';
import 'package:empathi_care/view/widget/invoice_rating_widget.dart';
import 'package:empathi_care/view/widget/rating_dialog.dart';
import 'package:empathi_care/view_model/detail_history_transaction_view_model.dart';
import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({super.key, required this.transactionId});

  final String transactionId;

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  bool isReviewed = false;

  @override
  Widget build(BuildContext context) {
    final DetailHistoryTransactionViewModel detailHistoryTransactionViewModel =
        Provider.of<DetailHistoryTransactionViewModel>(context, listen: false);
    final NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);

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
      body: FutureBuilder<DetailHistoryTransactionModel>(
        future: detailHistoryTransactionViewModel.getDetailHistoryTransaction(
            transactionId: widget.transactionId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final detailHistoryTransaction = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView(
                children: [
                  InvoiceHeader(
                    detailHistoryTransaction: detailHistoryTransaction,
                  ),
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
                      detailHistoryTransaction.data[0].doctorStarRating != 0
                          ? SizedBox(
                              width: 200,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    for (var i = 1;
                                        i <=
                                            detailHistoryTransaction
                                                .data[0].doctorStarRating;
                                        i++) ...[
                                      SvgPicture.asset(
                                        'assets/icons/star.svg',
                                        width: 20,
                                      )
                                    ]
                                  ]),
                            )
                          : const SizedBox(
                              height: 10,
                            ),
                    ],
                  ),
                  detailHistoryTransaction.data[0].doctorStarRating != 0
                      ? const SizedBox(height: 30)
                      : const SizedBox(),
                  InvoiceRatingWidget(
                    detailHistoryTransaction: detailHistoryTransaction,
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: FutureBuilder<DetailHistoryTransactionModel>(
          future: detailHistoryTransactionViewModel.getDetailHistoryTransaction(
              transactionId: widget.transactionId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final detailHistoryTransaction = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    detailHistoryTransaction.data[0].doctorStarRating == 0
                        ? SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(
                                    0xFF0085FF), //change background color of button
                                side:
                                    const BorderSide(color: Color(0xFF0085FF)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return RatingDialog(
                                      doctorRatingId: detailHistoryTransaction
                                          .data[0].doctorRatingId,
                                    );
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  'Beri Ulasan',
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
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
                            foregroundColor: Colors
                                .white, //change background color of button
                            backgroundColor: const Color(
                                0xFF0085FF), //change text color of button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RoutesScreen()),
                                (route) => false);
                            navigationProvider.setIndex(1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              'Pesan Lagi',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          )),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({
    super.key,
    required this.detailHistoryTransaction,
  });

  final DetailHistoryTransactionModel detailHistoryTransaction;

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime? date, String formatDate) {
      final DateFormat formatter = DateFormat(formatDate);
      return "${formatter.format(date!)}, ${DateFormat.Hm().format(date)}";
    }

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
              formatDate(
                  detailHistoryTransaction.data[0].createdAt, 'EEEE, dd MMMM'),
              style: GoogleFonts.montserrat(fontSize: 12),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Konseling ${detailHistoryTransaction.data[0].counselingType == "A" ? "Instan" : "Premium"}',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w600)),
            Text('Order ${detailHistoryTransaction.data[0].transactionId}',
                style: GoogleFonts.montserrat(fontSize: 12))
          ],
        )
      ],
    );
  }
}
