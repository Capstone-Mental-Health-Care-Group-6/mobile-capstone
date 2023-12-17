import 'package:flutter/material.dart';
import 'package:empathi_care/model/services/psikolog_service.dart';
import 'package:empathi_care/model/psikolog_model.dart';

class PsikologProvider extends ChangeNotifier {
  final PsikologApiService _apiService = PsikologApiService();
  double countRatingDocter = 0;
  int countReviewDocter = 0;
  int maxStarRating = 5;
  late int percentageRating;
  TextEditingController searchController = TextEditingController();
  bool isLoading = true, notFound = false;

  PsikologModel? dataPsikolog;

  Future<void> fetchListPsikolog(String token) async {
    try {
      isLoading = true;
      dataPsikolog = await _apiService.fetchPsikolog(token);
      for (var data in dataPsikolog!.data){
        countReviewDocter = data.ratings.where((rating) => rating.doctorReview.toString() != "No review yet").length;
        for(var rating in data.ratings){
          countRatingDocter += rating.doctorStarRating;
        }
      }
      percentageRating = (countRatingDocter / (maxStarRating * countReviewDocter) * 100).round();
      isLoading = false;
      notFound = false;
    } catch (e) {
      notFound = true;
      throw Exception(e);
    }
    notifyListeners();
  }

  Future<void> fetchListPsikologSearch(String token) async {
    try {
      dataPsikolog =
          await _apiService.fetchPsikologSearch(token, searchController.text);
      isLoading = false;
      notFound = false;
    } catch (e) {
      notFound = true;
    }
    notifyListeners();
  }
}
