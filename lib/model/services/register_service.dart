import 'package:dio/dio.dart';
import 'package:empathi_care/model/register_model.dart';
import 'package:empathi_care/utils/constant/url.dart';

class RegisterService {
  final Dio _dio = Dio();

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }

  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/assets/images/nullavatar.png');
  // }

  // Future<File> getImageFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('assets/$path');

  //   final file = File('${(await getTemporaryDirectory()).path}/$path');

  //   await file.create(recursive: true);
  //   await file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  //   return file;
  // }

  Future<Register> register(String name, String email, String password,
      String birthDate, String gender, String phone) async {
    try {
      // File imageFile = await getImageFileFromAssets('images/nullavatar.png');
      // String fileName = imageFile.path.split('/').last;
      // final imageFix = await MultipartFile.fromFile(imageFile.path,
      //     filename: fileName, contentType: MediaType('image', 'png'));
      // print(imageFile);
      // print(imageFix);
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "date_of_birth": birthDate,
        "gender": gender,
        "phone_number": phone,
      });

      final response =
          await _dio.post('${BaseUrl.baseurl}/register', data: formData);

      return Register.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
