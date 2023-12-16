class KonselingData {
  final List<Datum>? data;
  final String? message;

  KonselingData({
    this.data,
    this.message,
  });

  factory KonselingData.fromJson(Map<String, dynamic> json) {
    return KonselingData(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      message: json["message"],
    );
  }

  @override
  String toString() {
    return 'KonselingData{data: $data, message: $message}';
  }

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  String? name;

  Datum({
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      name: json["name"],
    );
  }

  @override
  String toString() {
    return '{name: $name}';
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDIzOTM0MjUsImlhdCI6MTcwMjM4OTgyNSwiaWQiOjMyLCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.3-9tjIaC_6v-mJRSNOTrIcamvSiq_1oft15311I-QrI";
