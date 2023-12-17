class DetailHistoryTransactionModel {
  List<Datum> data;
  String message;

  DetailHistoryTransactionModel({
    required this.data,
    required this.message,
  });

  factory DetailHistoryTransactionModel.fromJson(Map<String, dynamic> json) =>
      DetailHistoryTransactionModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String topicName;
  String patientName;
  String patientAvatar;
  String doctorAvatar;
  String doctorName;
  String methodName;
  String durationName;
  int counselingId;
  String counselingType;
  int userId;
  String transactionId;
  int priceMethod;
  int priceDuration;
  int priceCounseling;
  int priceResult;
  String paymentProof;
  int paymentStatus;
  String paymentType;
  int doctorRatingId;
  int doctorStarRating;
  String doctorReview;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.topicName,
    required this.patientName,
    required this.patientAvatar,
    required this.doctorAvatar,
    required this.doctorName,
    required this.methodName,
    required this.durationName,
    required this.counselingId,
    required this.counselingType,
    required this.userId,
    required this.transactionId,
    required this.priceMethod,
    required this.priceDuration,
    required this.priceCounseling,
    required this.priceResult,
    required this.paymentProof,
    required this.paymentStatus,
    required this.paymentType,
    required this.doctorRatingId,
    required this.doctorStarRating,
    required this.doctorReview,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        topicName: json["topic_name"],
        patientName: json["patient_name"],
        patientAvatar: json["patient_avatar"],
        doctorAvatar: json["doctor_avatar"],
        doctorName: json["doctor_name"],
        methodName: json["method_name"],
        durationName: json["duration_name"],
        counselingId: json["counseling_id"],
        counselingType: json["counseling_type"],
        userId: json["user_id"],
        transactionId: json["transaction_id"],
        priceMethod: json["price_method"],
        priceDuration: json["price_duration"],
        priceCounseling: json["price_counseling"],
        priceResult: json["price_result"],
        paymentProof: json["payment_proof"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        doctorRatingId: json["doctor_rating_id"],
        doctorStarRating: json["doctor_star_rating"],
        doctorReview: json["doctor_review"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "topic_name": topicName,
        "patient_name": patientName,
        "patient_avatar": patientAvatar,
        "doctor_avatar": doctorAvatar,
        "doctor_name": doctorName,
        "method_name": methodName,
        "duration_name": durationName,
        "counseling_id": counselingId,
        "counseling_type": counselingType,
        "user_id": userId,
        "transaction_id": transactionId,
        "price_method": priceMethod,
        "price_duration": priceDuration,
        "price_counseling": priceCounseling,
        "price_result": priceResult,
        "payment_proof": paymentProof,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "doctor_rating_id": doctorRatingId,
        "doctor_star_rating": doctorStarRating,
        "doctor_review": doctorReview,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
