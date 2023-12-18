import 'package:flutter/material.dart';
import 'package:empathi_care/model/services/psikolog_service.dart';
import 'package:empathi_care/model/psikolog_model.dart';

class PsikologProvider extends ChangeNotifier {
  final PsikologApiService _apiService = PsikologApiService();
  int percentageRating = 0;
  int percentageRatingTotal = 0;
  double countRatingDocter = 0;
  int countReviewDocter = 0;
  int maxStarRating = 5;
  TextEditingController searchController = TextEditingController();
  bool isLoading = true, notFound = false;

  PsikologModel? dataPsikolog;

  Future<void> fetchListPsikolog(String token) async {
    try {
      isLoading = true;
      dataPsikolog = await _apiService.fetchPsikolog(token);
      for (var data in dataPsikolog!.data){
        if(data.ratings.isNotEmpty){
          countReviewDocter = data.ratings.where((rating) => rating.doctorReview.toString() != "No review yet").length;
          for(var rating in data.ratings){
            countRatingDocter += rating.doctorStarRating;
          }

          if(countReviewDocter != 0 && countRatingDocter != 0.0){
            percentageRatingTotal = (countRatingDocter / (maxStarRating * countReviewDocter) * 100).round();
          }
        }else{
          countReviewDocter=0;
          countRatingDocter=0;
        }

        if(countReviewDocter != 0 && countRatingDocter != 0.0){
          percentageRating = percentageRatingTotal;
        }else{
          percentageRating = 0;
        }
      }
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
          await _apiService.fetchPsikologSearch(searchController.text,token);
      for (var data in dataPsikolog!.data){
        if(data.ratings.isNotEmpty){
          countReviewDocter = data.ratings.where((rating) => rating.doctorReview.toString() != "No review yet").length;
          for(var rating in data.ratings){
            countRatingDocter += rating.doctorStarRating;
          }

          if(countReviewDocter != 0 && countRatingDocter != 0.0){
            percentageRatingTotal = (countRatingDocter / (maxStarRating * countReviewDocter) * 100).round();
          }
        }else{
          countReviewDocter=0;
          countRatingDocter=0;
        }

        if(countReviewDocter != 0 && countRatingDocter != 0.0){
          percentageRating = percentageRatingTotal;
        }else{
          percentageRating = 0;
        }
      }
      isLoading = false;
      notFound = false;
    } catch (e) {
      notFound = true;
    }
    notifyListeners();
  }
}
