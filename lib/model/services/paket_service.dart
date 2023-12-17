import 'package:dio/dio.dart';

class PaketService {
  PaketService();

  final Dio dio = Dio();
  late String message;
  final url = "https://kmb5alta.online";

  Future getPaket(String type, String metode, String durasi) async {
    try {
      final Response response;
      if (type == "PREMIUM") {
        response = await dio.get(
          "$url/mobile/bundle?type=$type&metode=$metode&durasi=$durasi",
        );
      } else {
        response = await dio.get(
          "$url/mobile/bundle?type=$type",
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
      final response = await dio.get("$url/counseling/methods");

      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future getDuration() async {
    try {
      final response = await dio.get("$url/counseling/durations");
      final responseBody = response.data['data'];

      return responseBody;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
