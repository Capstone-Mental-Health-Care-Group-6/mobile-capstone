class ChangePasswordModel {
  final bool data;
  final String message;

  ChangePasswordModel({
    required this.data,
    required this.message,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };
}
