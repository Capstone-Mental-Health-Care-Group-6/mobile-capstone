class Login {
  final Data data;
  final String message;

  Login({
    required this.data,
    required this.message,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  final String name;
  final String email;
  final Token token;

  Data({
    required this.name,
    required this.email,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        token: Token.fromJson(json["token"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "token": token.toJson(),
      };
}

class Token {
  final String accessToken;
  final String refreshToken;

  Token({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
