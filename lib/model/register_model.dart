class Register {
  final Data data;
  final String message;

  Register({
    required this.data,
    required this.message,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
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
  final String gender;
  final DateTime dateOfBirth;
  final String avatar;
  final String phone;
  final String role;
  final String status;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.dateOfBirth,
    required this.avatar,
    required this.phone,
    required this.role,
    required this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        avatar: json["avatar"],
        phone: json["phone"],
        role: json["role"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "name": name,
        "email": email,
        "gender": gender,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "avatar": avatar,
        "phone": phone,
        "role": role,
        "status": status,
      };
}
