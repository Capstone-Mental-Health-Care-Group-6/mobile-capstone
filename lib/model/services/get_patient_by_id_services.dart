import 'package:dio/dio.dart';
import 'package:empathi_care/model/get_patient_by_id_model.dart';
import 'package:empathi_care/model/services/get_all_patient_services.dart';
import 'package:empathi_care/utils/constant/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPatientbyIdServices {
  final Dio _dio = Dio();
  GetAllPatientService getAllPatientService = GetAllPatientService();
  List<Data> patientDataList = [];
  String? id;
  String accesstoken = '';
  late SharedPreferences fullPatientData;

  Future<Data> getPatientById() async {
    fullPatientData = await SharedPreferences.getInstance();
    accesstoken = fullPatientData.getString('accesstoken').toString();

    try {
      id = (await getAllPatientService.getAllPatient(accesstoken)).toString();

      final response = await _dio.get('${BaseUrl.baseurl}/account/$id',
          options: Options(headers: {"Authorization": 'Bearer $accesstoken'}));
      return Data.fromJson(response.data['data']);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
