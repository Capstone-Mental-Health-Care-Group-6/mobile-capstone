import 'package:dio/dio.dart';
import 'package:empathi_care/model/mystate_model.dart';
import 'package:empathi_care/model/rating_and_review_model.dart';
import 'package:empathi_care/model/services/rating_and_review_service.dart';
import 'package:flutter/material.dart';

class RatingAndReviewViewModel with ChangeNotifier {
  TextEditingController reviewController = TextEditingController();
  final reviewFormKey = GlobalKey<FormState>();

  RatingAndReviewService ratingAndReviewService = RatingAndReviewService();
  RatingAndReviewModel? ratingAndReviewData;
  MyState myState = MyState.initial;

  Future<RatingAndReviewModel> addRatingDoctor(
      {required int doctorRatingId,
      required int doctorStarRating,
      required String doctorReview}) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      ratingAndReviewData = await ratingAndReviewService.addRatingDoctorById(
          doctorRatingId, doctorStarRating, doctorReview);

      myState = MyState.loaded;
      notifyListeners();

      return ratingAndReviewData!;
    } catch (e) {
      if (e is DioException) {
        myState = MyState.failed;
        notifyListeners();
        rethrow;
      }
      myState = MyState.failed;
      notifyListeners();

      throw Exception('Unknown Error');
    }
  }
}
