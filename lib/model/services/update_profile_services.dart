import 'package:dio/dio.dart';
import 'package:empathi_care/model/update_profile_model.dart';
import 'package:empathi_care/utils/constant/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sp;
String accesstoken = '';

class UpdateProfileService {
  final Dio _dio = Dio();

  Future<UpdateProfileModel> updateProfile({
    String? name,
    String? email,
    String? phone,
    String? birhtDate,
    String? gender,
    String? newavatar,
  }) async {
    sp = await SharedPreferences.getInstance();
    accesstoken = sp.getString('accesstoken').toString();
    try {
      FormData data = FormData.fromMap({
        if (name != null) 'name': name,
        if (email != null) 'email': email,
        if (birhtDate != null) 'date_of_birth': birhtDate,
        if (phone != null) 'phone_number': phone,
        if (newavatar != null)
          'avatar': await MultipartFile.fromFile(newavatar,
              filename: newavatar.toString()),
        if (gender != null) 'gender': gender,
      });
      final response = await _dio.put('${BaseUrl.baseurl}/account/update',
          data: data,
          options: Options(headers: {"Authorization": 'Bearer $accesstoken'}));
      return UpdateProfileModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
