class GetPatientbyIdModel {
  final Data data;
  final String message;

  GetPatientbyIdModel({
    required this.data,
    required this.message,
  });

  factory GetPatientbyIdModel.fromJson(Map<String, dynamic> json) =>
      GetPatientbyIdModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  final int id;
  final String name;
  final String email;
  final DateTime dateOfBirth;
  final String gender;
  final String avatar;
  final String phoneNumber;
  final String role;
  final String status;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.gender,
    required this.avatar,
    required this.phoneNumber,
    required this.role,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        name: json["name"],
        email: json["email"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        gender: json["gender"],
        avatar: json["avatar"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "email": email,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "gender": gender,
        "avatar": avatar,
        "phone_number": phoneNumber,
        "role": role,
        "status": status,
      };
}
