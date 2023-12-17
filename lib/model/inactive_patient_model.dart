class InactivePatientModel {
  final bool data;
  final String message;

  InactivePatientModel({
    required this.data,
    required this.message,
  });

  factory InactivePatientModel.fromJson(Map<String, dynamic> json) =>
      InactivePatientModel(
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };
}
