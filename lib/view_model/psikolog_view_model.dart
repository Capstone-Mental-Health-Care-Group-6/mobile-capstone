import 'package:flutter/material.dart';
import 'package:empathi_care/model/services/psikolog_service.dart';
import 'package:empathi_care/model/psikolog_model.dart';

class PsikologProvider extends ChangeNotifier {
  final PsikologApiService _apiService = PsikologApiService();
  TextEditingController searchController = TextEditingController();
  bool isLoading = true, notFound = false;

  PsikologModel? dataPsikolog;

  Future<void> fetchListPsikolog(String token) async {
    try {
      isLoading = true;
      dataPsikolog = await _apiService.fetchPsikolog(token);
      isLoading = false;
      notFound = false;
    } catch (e) {
      notFound = true;
    }
    notifyListeners();
  }

  Future<void> fetchListPsikologSearch(String token) async {
    try {
      dataPsikolog =
          await _apiService.fetchPsikologSearch(searchController.text, token);
      isLoading = false;
      notFound = false;
    } catch (e) {
      notFound = true;
    }
    notifyListeners();
  }

  int sumRatingPerDocter(Datum data) {
    int percentageRatingTotal = 0;
    if (data.ratings.isNotEmpty) {
      int countReviewDocter = data.ratings
          .where((rating) => rating.doctorReview != "No review yet" || rating.doctorStarRating != 0)
          .length;

      double countRatingDocter = data.ratings
          .fold(0.0, (sum, rating) => sum + rating.doctorStarRating);

      if (countReviewDocter != 0) {
        percentageRatingTotal =
            (countRatingDocter / (5 * countReviewDocter) * 100).round();
      }
      int percentageRating =
          (countReviewDocter != 0 && countRatingDocter != 0.0)
              ? percentageRatingTotal
              : 0;
      return percentageRating;
    }else{
      return 0;
    }
  }

  int sumReviewPerDocter(Datum data) {
    if (data.ratings.isNotEmpty) {
      int countReviewDocter = data.ratings
          .where((rating) => rating.doctorReview != "No review yet" || rating.doctorStarRating != 0)
          .length;
      return countReviewDocter;
    }else{
      return 0;
    }
  }
}
