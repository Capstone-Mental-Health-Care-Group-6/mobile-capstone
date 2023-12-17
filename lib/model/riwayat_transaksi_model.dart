class RiwayatTransaksi {
  final List<DataRiwayatTransaksi>? data;
  final String? message;

  RiwayatTransaksi({
    this.data,
    this.message,
  });

  @override
  String toString() {
    return '{$data, message: $message}';
  }

  factory RiwayatTransaksi.fromJson(Map<String, dynamic> json) =>
      RiwayatTransaksi(
        data: json["data"] == null
            ? []
            : List<DataRiwayatTransaksi>.from(
                json["data"]!.map((x) => DataRiwayatTransaksi.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class DataRiwayatTransaksi {
  String? topicName;
  String? patientName;
  String? patientAvatar;
  String? doctorAvatar;
  String? doctorName;
  String? methodName;
  String? durationName;
  int? counselingId;
  int? userId;
  String? transactionId;
  String? counselingType;
  int? priceMethod;
  int? priceDuration;
  int? priceCounseling;
  int priceResult;
  String? paymentProof;
  int? paymentStatus;
  String? paymentType;
  int? doctorRatingId;
  int? doctorStarRating;
  String? doctorReview;
  DateTime? createdAt;
  DateTime? updatedAt;

  DataRiwayatTransaksi({
    this.topicName,
    this.patientName,
    this.patientAvatar,
    this.doctorAvatar,
    this.doctorName,
    this.methodName,
    this.durationName,
    this.counselingId,
    this.userId,
    this.transactionId,
    this.counselingType,
    this.priceMethod,
    this.priceDuration,
    this.priceCounseling,
    required this.priceResult,
    this.paymentProof,
    this.paymentStatus,
    this.paymentType,
    this.doctorRatingId,
    this.doctorStarRating,
    this.doctorReview,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return '{'
        'topicName: $topicName, '
        'patientName: $patientName, '
        'patientAvatar: $patientAvatar, '
        'doctorAvatar: $doctorAvatar, '
        'doctorName : $doctorName,'
        'methodName: $methodName,'
        'durationName: $durationName,'
        'counselingId: $counselingId,'
        'userId: $userId,'
        'transactionId: $transactionId,'
        'counselingType: $counselingType,'
        'priceMethod: $priceMethod,'
        'priceDuration: $priceDuration,'
        'priceCounseling: $priceCounseling,'
        'priceResult: $priceResult,'
        'paymentProof: $paymentProof,'
        'paymentStatus: $paymentStatus,'
        'paymentType: $paymentType,'
        'doctorRatingId: $doctorRatingId,'
        'doctorStarRating: $doctorStarRating,'
        'doctorReview: $doctorReview,'
        'createdAt: $createdAt,'
        'updatedAt: $updatedAt,'
        '}';
  }

  factory DataRiwayatTransaksi.fromJson(Map<String, dynamic> json) =>
      DataRiwayatTransaksi(
        topicName: json["topic_name"] is String ? json["topic_name"] : "",
        patientName: json["patient_name"] is String ? json["patient_name"] : "",
        patientAvatar:
            json["patient_avatar"] is String ? json["patient_avatar"] : "",
        doctorAvatar:
            json["doctor_avatar"] is String ? json["doctor_avatar"] : "",
        doctorName: json["doctor_name"] is String ? json["doctor_name"] : "",
        methodName: json["method_name"] is String ? json["method_name"] : "",
        durationName:
            json["duration_name"] is String ? json["duration_name"] : "",
        counselingId: json["counseling_id"] is int ? json["counseling_id"] : 0,
        userId: json["user_id"] is int ? json["user_id"] : 0,
        transactionId:
            json["transaction_id"] is String ? json["transaction_id"] : "",
        counselingType:
            json["counseling_type"] is String ? json["counseling_type"] : "",
        priceMethod: json["price_method"] is int ? json["price_method"] : 0,
        priceDuration:
            json["price_duration"] is int ? json["price_duration"] : 0,
        priceCounseling:
            json["price_counseling"] is int ? json["price_counseling"] : 0,
        priceResult: json["price_result"] is int ? json["price_result"] : 0,
        paymentProof:
            json["payment_proof"] is String ? json["payment_proof"] : "",
        paymentStatus:
            json["payment_status"] is int ? json["payment_status"] : 0,
        paymentType: json["payment_type"] is String ? json["payment_type"] : "",
        doctorRatingId:
            json["doctor_rating_id"] is int ? json["doctor_rating_id"] : 0,
        doctorStarRating:
            json["doctor_star_rating"] is int ? json["doctor_star_rating"] : 0,
        doctorReview:
            json["doctor_review"] is String ? json["doctor_review"] : "",
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "topic_name": topicName,
        "patient_name": patientName,
        "patient_avatar": patientAvatar,
        "doctor_name": doctorName,
        "method_name": methodName,
        "duration_name": durationName,
        "counseling_id": counselingId,
        "user_id": userId,
        "transaction_id": transactionId,
        "counseling_type": counselingType,
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI4OTIwMDIsImlhdCI6MTcwMjgwNTYwMiwiaWQiOjc3LCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.h6BX5aTwnoqJDXO9ZQJx2n3iknaIitvWARIie5hGUbs";
