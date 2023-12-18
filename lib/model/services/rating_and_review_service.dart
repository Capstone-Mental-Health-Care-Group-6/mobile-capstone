import 'package:dio/dio.dart';
import 'package:empathi_care/model/rating_and_review_model.dart';
import 'package:empathi_care/utils/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingAndReviewService {
  final Dio _dio = Dio();
  late SharedPreferences authUser;
  late String accessToken;

  Future<RatingAndReviewModel> addRatingDoctorById(
      int doctorRatingId, int doctorStarRating, String doctorReview) async {
    try {
      Map<String, dynamic> payloads = {
        "doctor_star_rating": doctorStarRating,
        "doctor_review": doctorReview
      };

      authUser = await SharedPreferences.getInstance();
      accessToken = authUser.getString('accesstoken').toString();

      final response = await _dio.put('${Url.baseUrl}/doctor/rating/$doctorRatingId',
          data: payloads,
          options: Options(headers: {"Authorization": 'Bearer $accessToken'}));

      return RatingAndReviewModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
