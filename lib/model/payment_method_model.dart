class PaymentMethodModel {
  final int id;
  final String logo;
  final String name;
  final String type;
  final bool isCallbackUrl;

  PaymentMethodModel(
      {required this.id,
      required this.logo,
      required this.name,
      required this.type,
      required this.isCallbackUrl});

  static List<PaymentMethodModel> getListManualPayment() {
    return <PaymentMethodModel>[
      PaymentMethodModel(
          id: 1,
          logo: "bca.png",
          name: "BCA",
          type: "manual",
          isCallbackUrl: false),
      PaymentMethodModel(
          id: 2,
          logo: "mandiri.png",
          name: "Mandiri",
          type: "manual",
          isCallbackUrl: false),
      PaymentMethodModel(
          id: 3,
          logo: "bni.png",
          name: "BNI",
          type: "manual",
          isCallbackUrl: false),
    ];
  }

  static List<PaymentMethodModel> getListPaymentGateway() {
    return <PaymentMethodModel>[
      PaymentMethodModel(
          id: 1,
          logo: "bca.png",
          name: "BCA",
          type: "payment-gateway",
          isCallbackUrl: false),
      PaymentMethodModel(
          id: 2,
          logo: "bri.png",
          name: "BRI",
          type: "payment-gateway",
          isCallbackUrl: false),
      PaymentMethodModel(
          id: 3,
          logo: "bni.png",
          name: "BNI",
          type: "payment-gateway",
          isCallbackUrl: false),
      PaymentMethodModel(
          id: 4,
          logo: "gopay.png",
          name: "Gopay",
          type: "payment-gateway",
          isCallbackUrl: true),
      PaymentMethodModel(
          id: 5,
          logo: "qris.png",
          name: "QRIS",
          type: "payment-gateway",
          isCallbackUrl: true),
    ];
  }
}
