import 'package:dio/dio.dart';
import 'package:empathi_care/model/midtrans_transaction_model.dart';
import 'package:empathi_care/model/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionViewModel with ChangeNotifier {
  final TransactionService transactionService = TransactionService();
  MidtransTransactionModel? detailMidtransTransaction;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future makeMidtransTransaction(
      {required int topicId,
      required int patientId,
      required int methodId,
      required int durationId,
      required int counselingId,
      required int counselingSession,
      required String counselingType,
      required int priceMethod,
      required int priceCounseling,
      required int priceDuration,
      required String paymentType,
      required int doctorId}) async {
    try {
      _isLoading = true;
      notifyListeners();
      detailMidtransTransaction =
          await transactionService.makeMidtransTransaction(
              topicId: topicId,
              patientId: patientId,
              methodId: methodId,
              durationId: durationId,
              counselingId: counselingId,
              counselingSession: counselingSession,
              counselingType: counselingType,
              priceMethod: priceMethod,
              priceCounseling: priceCounseling,
              priceDuration: priceDuration,
              paymentType: paymentType,
              doctorId: doctorId);
      _isLoading = false;
      notifyListeners();
    } on DioException catch (_) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
