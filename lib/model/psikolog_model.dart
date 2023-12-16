class Psikolog {
    List<Datum> data;
    String message;

    Psikolog({
        required this.data,
        required this.message,
    });

    factory Psikolog.fromJson(Map<String, dynamic> json) => Psikolog(
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
    String doctorNumberphone;
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
    int doctorExpertise;
    List<Experience> experience;
    List<Education> education;
    List<Workday> workday;
    dynamic ratings;

    Datum({
        required this.id,
        required this.userId,
        required this.doctorName,
        required this.doctorNik,
        required this.doctorDob,
        required this.doctorProvinsi,
        required this.doctorKota,
        required this.doctorNumberphone,
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
        required this.doctorExpertise,
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
        doctorNumberphone: json["doctor_numberphone"],
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
        doctorExpertise: json["doctor_expertise"],
        experience: List<Experience>.from(json["experience"].map((x) => Experience.fromJson(x))),
        education: List<Education>.from(json["education"].map((x) => Education.fromJson(x))),
        workday: List<Workday>.from(json["workday"].map((x) => Workday.fromJson(x))),
        ratings: json["ratings"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "doctor_name": doctorName,
        "doctor_nik": doctorNik,
        "doctor_dob": doctorDob,
        "doctor_provinsi": doctorProvinsi,
        "doctor_kota": doctorKota,
        "doctor_numberphone": doctorNumberphone,
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
        "doctor_expertise": doctorExpertise,
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
        "education": List<dynamic>.from(education.map((x) => x.toJson())),
        "workday": List<dynamic>.from(workday.map((x) => x.toJson())),
        "ratings": ratings,
    };
}

class Education {
    int id;
    int doctorId;
    DoctorUniversity doctorUniversity;
    DoctorStudyProgram doctorStudyProgram;
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
        doctorUniversity: doctorUniversityValues.map[json["doctor_university"]]!,
        doctorStudyProgram: doctorStudyProgramValues.map[json["doctor_study_program"]]!,
        doctorEnrollYear: DateTime.parse(json["doctor_enroll_year"]),
        doctorGraduateYear: DateTime.parse(json["doctor_graduate_year"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "doctor_university": doctorUniversityValues.reverse[doctorUniversity],
        "doctor_study_program": doctorStudyProgramValues.reverse[doctorStudyProgram],
        "doctor_enroll_year": doctorEnrollYear.toIso8601String(),
        "doctor_graduate_year": doctorGraduateYear.toIso8601String(),
    };
}

enum DoctorStudyProgram {
    PROGRAM_C,
    PROGRAM_D
}

final doctorStudyProgramValues = EnumValues({
    "Program C ": DoctorStudyProgram.PROGRAM_C,
    "Program D": DoctorStudyProgram.PROGRAM_D
});

enum DoctorUniversity {
    UNIVERSITY_C,
    UNIVERSITY_D
}

final doctorUniversityValues = EnumValues({
    "University C": DoctorUniversity.UNIVERSITY_C,
    "University D": DoctorUniversity.UNIVERSITY_D
});

class Experience {
    int id;
    int doctorId;
    DoctorCompany doctorCompany;
    DoctorTitle doctorTitle;
    DoctorCompany doctorCompanyAddress;
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
        doctorCompany: doctorCompanyValues.map[json["doctor_company"]]!,
        doctorTitle: doctorTitleValues.map[json["doctor_title"]]!,
        doctorCompanyAddress: doctorCompanyValues.map[json["doctor_company_address"]]!,
        doctorStartDate: DateTime.parse(json["doctor_start_date"]),
        doctorEndDate: DateTime.parse(json["doctor_end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "doctor_company": doctorCompanyValues.reverse[doctorCompany],
        "doctor_title": doctorTitleValues.reverse[doctorTitle],
        "doctor_company_address": doctorCompanyValues.reverse[doctorCompanyAddress],
        "doctor_start_date": doctorStartDate.toIso8601String(),
        "doctor_end_date": doctorEndDate.toIso8601String(),
    };
}

enum DoctorCompany {
    COMPANY_C,
    COMPANY_D,
    EMPTY
}

final doctorCompanyValues = EnumValues({
    "Company C": DoctorCompany.COMPANY_C,
    "Company D": DoctorCompany.COMPANY_D,
    "": DoctorCompany.EMPTY
});

enum DoctorTitle {
    TITLE_C,
    TITLE_D
}

final doctorTitleValues = EnumValues({
    "Title C": DoctorTitle.TITLE_C,
    "Title D": DoctorTitle.TITLE_D
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

String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI2MjI5MDYsImlhdCI6MTcwMjYxOTMwNiwiaWQiOjIzLCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.zb7Bq1RFnbwGP6zXAnEaX6yNWb-qnKaskIAQ90zEBsE";