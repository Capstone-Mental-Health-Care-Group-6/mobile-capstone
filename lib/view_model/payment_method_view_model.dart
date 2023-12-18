import 'package:empathi_care/model/payment_method_model.dart';
import 'package:flutter/material.dart';

class PaymentMethodViewModel extends ChangeNotifier {
  String? _selectedPaymentMethod;
  late List<PaymentMethodModel> _paymentMethods;

  String? get selectedPaymentMethod => _selectedPaymentMethod;
  List<PaymentMethodModel> get paymentMethods => _paymentMethods;

  void setSelectedPaymentMethod(String paymentMethod) {
    _selectedPaymentMethod = paymentMethod;
    notifyListeners();
  }

  void setPaymentMethods(List<PaymentMethodModel> paymentMethods) {
    _paymentMethods = paymentMethods;
    notifyListeners();
  }
}