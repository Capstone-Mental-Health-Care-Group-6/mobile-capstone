import 'package:empathi_care/view/widget/payment_instruction.dart';
import 'package:flutter/material.dart';

class PaymentInstructionList extends StatefulWidget {
  const PaymentInstructionList({super.key});

  @override
  State<PaymentInstructionList> createState() => _PaymentInstructionListState();
}

class _PaymentInstructionListState extends State<PaymentInstructionList> {
  final List<Map<String, dynamic>> paymentInstructions = [
    {
      'title': 'E-wallet',
      'isExpanded': false,
      'instruction': '''Tatacara pembayaran E-wallet:

1. Unduh dan instal aplikasi E-wallet
2. Daftar dan aktifkan akun
3. Isi saldo E-wallet
4. Buka aplikasi dan pilih "Pembayaran"
5. Pilih penerima dan jumlah pembayaran
6. Konfirmasi dan autentikasi (jika diperlukan)
7. Proses pembayaran
8. Terima bukti pembayaran''',
    },
    {
      'title': 'Bank-Transfer',
      'isExpanded': false,
      'instruction': '''Tatacara pembayaran Bank Transfer:

1. Pilih Bank
2. Isi Formulir Transfer
3. Verifikasi Informasi
4. Konfirmasi Biaya
5. Lakukan Transfer
6. Simpan Bukti Transfer
7. Cek Saldo Rekening'''
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: paymentInstructions.map((paymentInstruction) {
        debugPrint(paymentInstruction.toString());
        return PaymentInstruction(
          title: paymentInstruction['title'],
          isExpanded: paymentInstruction['isExpanded'],
          instruction: paymentInstruction['instruction'],
        );
      }).toList(),
    );
  }
}
