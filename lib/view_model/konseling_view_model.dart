import 'package:empathi_care/model/konseling_model.dart';
import 'package:empathi_care/model/services/konseling_service.dart';
import 'package:flutter/material.dart';

class KonselingProvider extends ChangeNotifier {
  final KonsellingApiService _apiService = KonsellingApiService();
  KonselingData _topikKonseling = KonselingData(); 

  KonselingData get topikKonseling => _topikKonseling;

  Future<void> fetchTopikKonseling(String token) async {
    try {
      _topikKonseling = await _apiService.fetchTopik(token);
      notifyListeners();
    } catch (e) {
      throw Exception('Gagal mendapatkan data pengguna: $e');
    }
  }

  getTextForIndex(int index) {
    switch (index) {
      case 0:
        return "Periksa surel konfirmasi pembayaran dari Midtrans sebagai bukti bahwa pembayaran telah diterima.";
      case 1:
        return "Pastikan layanan Konseling Plus telah diaktifkan dan dapat diakses melalui ruang obrolan konseling.";
      case 2:
        return "Isi data diri awal sambil menanti sambutan dari psikolog.";
      case 3:
        return "Setelah mengisi informasi diri, sampaikan permasalahanmu melalui ruang obrolan dengan batasan pesan 1500 karakter.";
      case 4:
        return "Jika melebihi 1500 karakter, pesan tidak dapat dikirim, jadi perlu disingkat atau dipotong.";
      case 5:
        return "Nyalakan notifikasi dan buka aplikasi Riliv secara teratur karena setiap smartphone memiliki aturan yang berbeda. Pastikan tidak melewatkan pesan yang masuk!";
      case 6:
        return "Jika ada keterlambatan pesan atau notifikasi yang tidak muncul, coba tutup sementara aplikasi Riliv dan buka kembali.";
    }
  }
}
