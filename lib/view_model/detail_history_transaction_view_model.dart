import 'package:dio/dio.dart';
import 'package:empathi_care/model/detail_history_transaction_model.dart';
import 'package:empathi_care/model/services/detail_history_transaction_service.dart';
import 'package:flutter/material.dart';

class DetailHistoryTransactionViewModel extends ChangeNotifier {
  DetailHistoryTransactionService detailHistoryTransactionService =
      DetailHistoryTransactionService();
  DetailHistoryTransactionModel? detailHistoryTransactionData;
  bool isLoading = true;

  Future<DetailHistoryTransactionModel> getDetailHistoryTransaction(
      {required String transactionId}) async {
    try {
      detailHistoryTransactionData = await detailHistoryTransactionService
          .fetchDetailHistoryTransactionById(transactionId: transactionId);

      notifyListeners();
      return detailHistoryTransactionData!;
    } catch (e) {
      if (e is DioException) {
        isLoading = false;
        notifyListeners();
        rethrow;
      }

      throw Exception('Unknown Error');
    }
  }
}
