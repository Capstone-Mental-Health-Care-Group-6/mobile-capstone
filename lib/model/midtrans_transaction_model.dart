class MidtransTransactionModel {
  Data data;
  String message;

  MidtransTransactionModel({
    required this.data,
    required this.message,
  });

  factory MidtransTransactionModel.fromJson(Map<String, dynamic> json) =>
      MidtransTransactionModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String paymentType;
  String? vaAccount;
  String? callbackUrl;

  Data({required this.paymentType, this.vaAccount, this.callbackUrl});

  factory Data.fromJson(Map<String, dynamic> json) => json["va_account"] != null
      ? Data(
          paymentType: json["payment_type"],
          vaAccount: json["va_account"],
        )
      : Data(
          paymentType: json["payment_type"],
          callbackUrl: json["callback_url"],
        );

  Map<String, dynamic> toJson() => vaAccount != null
      ? {
          "payment_type": paymentType,
          "va_account": vaAccount,
        }
      : {
          "payment_type": paymentType,
          "callback_url": callbackUrl,
        };
}
