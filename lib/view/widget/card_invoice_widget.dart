import 'package:empathi_care/utils/constant/color.dart';
import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:empathi_care/view_model/konseling_view_model.dart';
import 'package:empathi_care/view_model/paket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardInvoicePayment extends StatelessWidget {
  const CardInvoicePayment({super.key});

  @override
  Widget build(BuildContext context) {
    final counselingViewModel =
        Provider.of<KonselingProvider>(context, listen: false);
    final packageViewModel = Provider.of<PaketProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: _buildContent(
            counselingViewModel: counselingViewModel,
            packageViewModel: packageViewModel),
      ),
    );
  }

  Widget _buildContent(
      {required KonselingProvider counselingViewModel,
      required PaketProvider packageViewModel}) {
    String formatNumberToDecimal(int number) {
      NumberFormat numberFormat = NumberFormat.decimalPattern('id');

      return numberFormat.format(number);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPackageIntroduction(
            counselingViewModel: counselingViewModel,
            packageViewModel: packageViewModel),
        const Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Divider(
            thickness: 2,
          ),
        ),
        _buildSectionTitle("Detail Pemesanan"),
        _buildOrderDetails(
            "Paket Chat",
            packageViewModel.listPaket[packageViewModel.selectedPaket!]
                ["type"]),
        _buildOrderDetails(
            "Topik", counselingViewModel.getid.data![0].name ?? '-'),
        _buildOrderDetails("Durasi", "30 Menit"),
        _buildOrderDetails("Sesi Konseling",
            "${packageViewModel.listPaket[packageViewModel.selectedPaket!]["sessions"]} Sesi"),
        _buildSectionTitle("Detail Pembayaran"),
        _buildPaymentDetails("Biaya Konsultasi",
            "Rp ${formatNumberToDecimal(packageViewModel.listPaket[packageViewModel.selectedPaket!]["price"])}"),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            thickness: 2,
          ),
        ),
        _buildTotalPrice(
            handleFormatNumberToDecimal: formatNumberToDecimal,
            counselingViewModel: counselingViewModel,
            packageViewModel: packageViewModel),
      ],
    );
  }

  Widget _buildPackageIntroduction(
      {required KonselingProvider counselingViewModel,
      required PaketProvider packageViewModel}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  packageViewModel.listPaket[packageViewModel.selectedPaket!]
                      ["name"],
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.fontMontserrat),
                ),
              ),
              const Text("Konseling",
                  style: TextStyle(
                      fontSize: 16, fontFamily: MyFont.fontMontserrat)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size(90, 20),
              backgroundColor: ColorBase.primaryColor,
            ),
            child: Text(
              packageViewModel.listPaket[packageViewModel.selectedPaket!]
                  ["type"],
              style: const TextStyle(
                  color: Colors.black, fontFamily: MyFont.fontMontserrat),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 16, fontFamily: MyFont.fontMontserrat)),
          Text(value,
              style: const TextStyle(
                  fontSize: 16, fontFamily: MyFont.fontMontserrat)),
        ],
      ),
    );
  }

  Widget _buildPaymentDetails(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 16, fontFamily: MyFont.fontMontserrat)),
          Text(value,
              style: const TextStyle(
                  fontSize: 16, fontFamily: MyFont.fontMontserrat)),
        ],
      ),
    );
  }

  Widget _buildTotalPrice(
      {required Function handleFormatNumberToDecimal,
      required KonselingProvider counselingViewModel,
      required PaketProvider packageViewModel}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Total Harga",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: MyFont.fontMontserrat),
          ),
          Text(
            "Rp ${handleFormatNumberToDecimal(packageViewModel.listPaket[packageViewModel.selectedPaket!]["price"])}",
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: MyFont.fontMontserrat),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: MyFont.fontMontserrat),
      ),
    );
  }
}
