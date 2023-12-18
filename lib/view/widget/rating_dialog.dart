import 'package:dio/dio.dart';
import 'package:empathi_care/model/rating_and_review_model.dart';
import 'package:empathi_care/view_model/detail_history_transaction_view_model.dart';
import 'package:empathi_care/view_model/rating_and_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key, required this.doctorRatingId});

  final int doctorRatingId;

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  double _iconRating = 0;

  @override
  Widget build(BuildContext context) {
    final RatingAndReviewViewModel ratingAndReviewViewModel =
        Provider.of<RatingAndReviewViewModel>(context, listen: false);

    void addRatingDoctor() async {
      try {
        await ratingAndReviewViewModel.addRatingDoctor(
            doctorRatingId: widget.doctorRatingId,
            doctorStarRating: _iconRating.round(),
            doctorReview: ratingAndReviewViewModel.reviewController.text);

        if (mounted) {
          // final snackBar = SnackBar(
          //   content: Text(ratingAndReviewData.message),
          //   backgroundColor: const Color(0XFF0085FF),
          // );
          Navigator.of(context).pop();
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } on DioException catch (e) {
        if (e.response != null) {
          final snackBar = SnackBar(
            content: Text('${e.response?.data['message']}'),
            backgroundColor: const Color(0XFF0085FF),
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      }
    }

    return AlertDialog(
        surfaceTintColor: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  textAlign: TextAlign.center,
                  "Bagaimana dengan konsultasinya?",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "(1 adalah mengecewakan, 5 adalah terbaik)",
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 25),
                child: GFRating(
                  spacing: 20,
                  borderColor: const Color.fromARGB(255, 255, 229, 0),
                  filledIcon: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 255, 229, 0),
                  ),
                  allowHalfRating: true,
                  size: GFSize.SMALL,
                  value: _iconRating,
                  onChanged: (value) {
                    setState(() {
                      _iconRating = value;
                    });
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Opsional",
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: ratingAndReviewViewModel.reviewFormKey,
                    child: TextFormField(
                      controller: ratingAndReviewViewModel.reviewController,
                      keyboardType: TextInputType.text,
                      // validator: (String? value) {
                      //    if (value == '') {
                      //   return 'Review anda masih kosong';
                      // }
                      //    return null;
                      // },
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: "Silahkan tulis komentar anda!",
                          hintStyle: GoogleFonts.montserrat(
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor:
                              const Color.fromARGB(255, 0, 133, 255)),
                      onPressed: addRatingDoctor,
                      child: Text(
                        "Kirim",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
