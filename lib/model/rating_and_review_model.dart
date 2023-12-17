class RatingAndReviewModel {
  bool data;
  String message;

  RatingAndReviewModel({
    required this.data,
    required this.message,
  });

  factory RatingAndReviewModel.fromJson(Map<String, dynamic> json) =>
      RatingAndReviewModel(
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "message": message,
      };
}
