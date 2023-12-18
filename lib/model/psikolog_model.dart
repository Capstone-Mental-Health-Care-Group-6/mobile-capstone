class PsikologModel {
    List<Datum> data;
    String message;

    PsikologModel({
        required this.data,
        required this.message,
    });

    factory PsikologModel.fromJson(Map<String, dynamic> json) => PsikologModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int id;
    int userId;
    String doctorName;
    String doctorNik;
    String doctorDob;
    String doctorProvinsi;
    String doctorKota;
    String doctorNumberPhone;
    String doctorGender;
    String doctorAvatar;
    String doctorDescription;
    String doctorMeetLink;
    String doctorSipp;
    String doctorSippFile;
    String doctorStr;
    String doctorStrFile;
    String doctorCv;
    String doctorIjazah;
    int doctorBalance;
    String doctorStatus;
    int expertiseId;
    List<Experience> experience;
    List<Education> education;
    List<Workday> workday;
    List<Rating>? ratings;

    Datum({
        required this.id,
        required this.userId,
        required this.doctorName,
        required this.doctorNik,
        required this.doctorDob,
        required this.doctorProvinsi,
        required this.doctorKota,
        required this.doctorNumberPhone,
        required this.doctorGender,
        required this.doctorAvatar,
        required this.doctorDescription,
        required this.doctorMeetLink,
        required this.doctorSipp,
        required this.doctorSippFile,
        required this.doctorStr,
        required this.doctorStrFile,
        required this.doctorCv,
        required this.doctorIjazah,
        required this.doctorBalance,
        required this.doctorStatus,
        required this.expertiseId,
        required this.experience,
        required this.education,
        required this.workday,
        required this.ratings,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        doctorName: json["doctor_name"],
        doctorNik: json["doctor_nik"],
        doctorDob: json["doctor_dob"],
        doctorProvinsi: json["doctor_provinsi"],
        doctorKota: json["doctor_kota"],
        doctorNumberPhone: json["doctor_number_phone"],
        doctorGender: json["doctor_gender"],
        doctorAvatar: json["doctor_avatar"],
        doctorDescription: json["doctor_description"],
        doctorMeetLink: json["doctor_meet_link"],
        doctorSipp: json["doctor_sipp"],
        doctorSippFile: json["doctor_sipp_file"],
        doctorStr: json["doctor_str"],
        doctorStrFile: json["doctor_str_file"],
        doctorCv: json["doctor_cv"],
        doctorIjazah: json["doctor_ijazah"],
        doctorBalance: json["doctor_balance"],
        doctorStatus: json["doctor_status"],
        expertiseId: json["expertise_id"],
        experience: List<Experience>.from(json["experience"].map((x) => Experience.fromJson(x))),
        education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
        workday: List<Workday>.from(json["workday"].map((x) => Workday.fromJson(x))),
        ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_name": doctorName,
        "doctor_nik": doctorNik,
        "doctor_dob": doctorDob,
        "doctor_provinsi": doctorProvinsi,
        "doctor_kota": doctorKota,
        "doctor_number_phone": doctorNumberPhone,
        "doctor_gender": doctorGender,
        "doctor_avatar": doctorAvatar,
        "doctor_description": doctorDescription,
        "doctor_meet_link": doctorMeetLink,
        "doctor_sipp": doctorSipp,
        "doctor_sipp_file": doctorSippFile,
        "doctor_str": doctorStr,
        "doctor_str_file": doctorStrFile,
        "doctor_cv": doctorCv,
        "doctor_ijazah": doctorIjazah,
        "doctor_balance": doctorBalance,
        "doctor_status": doctorStatus,
        "expertise_id": expertiseId,
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "workday": List<dynamic>.from(workday.map((x) => x.toJson())),
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
    };
}

class Education {
    int id;
    int doctorId;
    String doctorUniversity;
    String doctorStudyProgram;
    DateTime doctorEnrollYear;
    DateTime doctorGraduateYear;

    Education({
        required this.id,
        required this.doctorId,
        required this.doctorUniversity,
        required this.doctorStudyProgram,
        required this.doctorEnrollYear,
        required this.doctorGraduateYear,
    });

    factory Education.fromJson(Map<String, dynamic> json) => Education(
        id: json["id"],
        doctorId: json["doctor_id"],
        doctorUniversity: json["doctor_university"],
        doctorStudyProgram: json["doctor_study_program"],
        doctorEnrollYear: DateTime.parse(json["doctor_enroll_year"]),
        doctorGraduateYear: DateTime.parse(json["doctor_graduate_year"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "doctor_university": doctorUniversity,
        "doctor_study_program": doctorStudyProgram,
        "doctor_enroll_year": doctorEnrollYear.toIso8601String(),
        "doctor_graduate_year": doctorGraduateYear.toIso8601String(),
    };
}

class Experience {
    int id;
    int doctorId;
    String doctorCompany;
    String doctorTitle;
    String doctorCompanyAddress;
    DateTime doctorStartDate;
    DateTime doctorEndDate;

    Experience({
        required this.id,
        required this.doctorId,
        required this.doctorCompany,
        required this.doctorTitle,
        required this.doctorCompanyAddress,
        required this.doctorStartDate,
        required this.doctorEndDate,
    });

    factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"],
        doctorId: json["doctor_id"],
        doctorCompany: json["doctor_company"],
        doctorTitle: json["doctor_title"],
        doctorCompanyAddress: json["doctor_company_address"],
        doctorStartDate: DateTime.parse(json["doctor_start_date"]),
        doctorEndDate: DateTime.parse(json["doctor_end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "doctor_company": doctorCompany,
        "doctor_title": doctorTitle,
        "doctor_company_address": doctorCompanyAddress,
        "doctor_start_date": doctorStartDate.toIso8601String(),
        "doctor_end_date": doctorEndDate.toIso8601String(),
    };
}

class Rating {
    int id;
    int doctorId;
    DoctorName doctorName;
    String doctorAvatar;
    int patientId;
    PatientName patientName;
    String patientAvatar;
    String transactionId;
    int doctorStarRating;
    DoctorReview doctorReview;

    Rating({
        required this.id,
        required this.doctorId,
        required this.doctorName,
        required this.doctorAvatar,
        required this.patientId,
        required this.patientName,
        required this.patientAvatar,
        required this.transactionId,
        required this.doctorStarRating,
        required this.doctorReview,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        doctorId: json["doctor_id"],
        doctorName: doctorNameValues.map[json["doctor_name"]]!,
        doctorAvatar: json["doctor_avatar"],
        patientId: json["patient_id"],
        patientName: patientNameValues.map[json["patient_name"]]!,
        patientAvatar: json["patient_avatar"],
        transactionId: json["transaction_id"],
        doctorStarRating: json["doctor_star_rating"],
        doctorReview: doctorReviewValues.map[json["doctor_review"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "doctor_name": doctorNameValues.reverse[doctorName],
        "doctor_avatar": doctorAvatar,
        "patient_id": patientId,
        "patient_name": patientNameValues.reverse[patientName],
        "patient_avatar": patientAvatar,
        "transaction_id": transactionId,
        "doctor_star_rating": doctorStarRating,
        "doctor_review": doctorReviewValues.reverse[doctorReview],
    };
}

enum DoctorName {
    DR_FAUZAN_ALI_VIJSMA_S_KOM
}

final doctorNameValues = EnumValues({
    "dr. Fauzan Ali Vijsma, S.Kom.": DoctorName.DR_FAUZAN_ALI_VIJSMA_S_KOM
});

enum DoctorReview {
    GOOD,
    GOOD_EXPERIENCE,
    GOOD_PSIKOLOG,
    NO_REVIEW_YET
}

final doctorReviewValues = EnumValues({
    "Good": DoctorReview.GOOD,
    "Good Experience ": DoctorReview.GOOD_EXPERIENCE,
    "Good Psikolog": DoctorReview.GOOD_PSIKOLOG,
    "No review yet": DoctorReview.NO_REVIEW_YET
});

enum PatientName {
    ABDULLOH_FAHMI,
    DHEA1,
    FAUZIAH,
    TESTCLOUD
}

final patientNameValues = EnumValues({
    "Abdulloh Fahmi": PatientName.ABDULLOH_FAHMI,
    "Dhea1": PatientName.DHEA1,
    "fauziah": PatientName.FAUZIAH,
    "testcloud": PatientName.TESTCLOUD
});

class Workday {
    int id;
    int doctorId;
    int workdayId;
    DateTime startTime;
    DateTime endTime;

    Workday({
        required this.id,
        required this.doctorId,
        required this.workdayId,
        required this.startTime,
        required this.endTime,
    });

    factory Workday.fromJson(Map<String, dynamic> json) => Workday(
        id: json["id"],
        doctorId: json["doctor_id"],
        workdayId: json["workday_id"],
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "workday_id": workdayId,
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}

String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI5NDUzOTIsImlhdCI6MTcwMjg1ODk5MiwiaWQiOjc5LCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.ehEqPzbDRwCETdOo7QzpMfbRjEKMB6tU7O8m4V4Ya6A";