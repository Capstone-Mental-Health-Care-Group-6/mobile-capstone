class ZoomModel {
  Data? data;
  String? message;

  ZoomModel({this.data, this.message});

  ZoomModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? transactionId;
  int? userId;
  String? doctorAvatar;
  String? doctorName;
  int? doctorExpertise;
  String? doctorMeetLink;
  String? date;
  String? time;
  int? duration;
  String? status;
  String? alasan;
  String? detailAlasan;
  String? createdAt;
  String? updatedAt;
  String? counselingType;
  String? counselingMethod;
  String? counselingTopic;

  Data(
      {this.id,
      this.transactionId,
      this.userId,
      this.doctorAvatar,
      this.doctorName,
      this.doctorExpertise,
      this.doctorMeetLink,
      this.date,
      this.time,
      this.duration,
      this.status,
      this.alasan,
      this.detailAlasan,
      this.createdAt,
      this.updatedAt,
      this.counselingType,
      this.counselingMethod,
      this.counselingTopic});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    userId = json['user_id'];
    doctorAvatar = json['doctor_avatar'];
    doctorName = json['doctor_name'];
    doctorExpertise = json['doctor_expertise'];
    doctorMeetLink = json['doctor_meet_link'];
    date = json['date'];
    time = json['time'];
    duration = json['duration'];
    status = json['status'];
    alasan = json['alasan'];
    detailAlasan = json['detail_alasan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    counselingType = json['counseling_type'];
    counselingMethod = json['counseling_method'];
    counselingTopic = json['counseling_topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_id'] = transactionId;
    data['user_id'] = userId;
    data['doctor_avatar'] = doctorAvatar;
    data['doctor_name'] = doctorName;
    data['doctor_expertise'] = doctorExpertise;
    data['doctor_meet_link'] = doctorMeetLink;
    data['date'] = date;
    data['time'] = time;
    data['duration'] = duration;
    data['status'] = status;
    data['alasan'] = alasan;
    data['detail_alasan'] = detailAlasan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['counseling_type'] = counselingType;
    data['counseling_method'] = counselingMethod;
    data['counseling_topic'] = counselingTopic;
    return data;
  }
}