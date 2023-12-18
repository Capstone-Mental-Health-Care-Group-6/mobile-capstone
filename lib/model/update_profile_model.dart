class UpdateProfileModel {
  final bool data;
  final String message;

  UpdateProfileModel({
    required this.data,
    required this.message,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };
}
