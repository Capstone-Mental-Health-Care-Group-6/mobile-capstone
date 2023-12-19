import 'package:dio/dio.dart';
import 'package:empathi_care/utils/baseurl.dart';

class PaketService {
  PaketService();

  final Dio dio = Dio();
  late String message;

  Future getPaket(String type, String metode, String durasi) async {
    try {
      final Response response;
      if (type == "PREMIUM") {
        response = await dio.get(
          "${Url.baseUrl}/mobile/bundle?type=$type&metode=$metode&durasi=$durasi",
        );
      } else {
        response = await dio.get(
          "${Url.baseUrl}/mobile/bundle?type=$type",
        );
      }
      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future getMetohod() async {
    try {
      final response = await dio.get("${Url.baseUrl}/counseling/methods");

      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future getDuration() async {
    try {
      final response = await dio.get("${Url.baseUrl}/counseling/durations");
      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
