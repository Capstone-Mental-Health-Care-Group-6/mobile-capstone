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
    return '{data: $data, message: $message}';
  }

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int? id;
  String? name;

  Datum({
    this.id,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json["id"],
      name: json["name"],
    );
  }

  @override
  String toString() {
    return '{id: $id,name: $name}';
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}



String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI0MDA5NDcsImlhdCI6MTcwMjM5NzM0NywiaWQiOjE1LCJyb2xlIjoiUGF0aWVudCIsInN0YXR1cyI6IkFjdGl2ZSJ9.NN0P0yYhPaVSHl99plK9zIPt9JclC3Jb8OYStL_y434";
