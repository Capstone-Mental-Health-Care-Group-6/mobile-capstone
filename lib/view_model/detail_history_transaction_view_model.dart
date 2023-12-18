import 'package:dio/dio.dart';
import 'package:empathi_care/model/detail_history_transaction_model.dart';
import 'package:empathi_care/model/mystate_model.dart';
import 'package:empathi_care/model/services/detail_history_transaction_service.dart';
import 'package:flutter/material.dart';

class DetailHistoryTransactionViewModel with ChangeNotifier {
  DetailHistoryTransactionService detailHistoryTransactionService =
      DetailHistoryTransactionService();
  DetailHistoryTransactionModel? detailHistoryTransactionData;
  MyState myState = MyState.initial;

  Future<DetailHistoryTransactionModel> getDetailHistoryTransaction(
      {required String transactionId}) async {
    try {
      myState = MyState.loading;
      notifyListeners();

      detailHistoryTransactionData = await detailHistoryTransactionService
          .fetchDetailHistoryTransactionById(transactionId: transactionId);

      myState = MyState.loaded;
      notifyListeners();

      return detailHistoryTransactionData!;
    } catch (e) {
      if (e is DioException) {
        myState = MyState.failed;
        notifyListeners();
        rethrow;
      }
      myState = MyState.failed;
      notifyListeners();

      throw Exception('Unknown Error');
    }
  }
}
