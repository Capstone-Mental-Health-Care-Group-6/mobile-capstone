import 'package:empathi_care/utils/constant/color.dart';
import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:flutter/material.dart';

class CardInvoicePayment extends StatelessWidget {
  const CardInvoicePayment({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPackageIntroduction(),
        const Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Divider(
            thickness: 2,
          ),
        ),
        _buildSectionTitle("Detail Pemesanan"),
        _buildOrderDetails("Paket Chat", "Instan"),
        _buildOrderDetails("Topik", "Stress"),
        _buildOrderDetails("Durasi", "30 Menit"),
        _buildOrderDetails("Sesi Konseling", "1 Sesi"),
        _buildSectionTitle("Detail Pembayaran"),
        _buildPaymentDetails("Biaya Konsultasi", "Rp.80.000"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            "ID 321ABC123",
            style: TextStyle(fontFamily: MyFont.fontMontserrat),
          ),
        ),
        _buildPaymentDetails("Diskon Voucher", "Rp.0"),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            thickness: 2,
          ),
        ),
        _buildTotalPrice(),
      ],
    );
  }

  Widget _buildPackageIntroduction() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Paket Perkenalan",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFont.fontMontserrat),
                ),
              ),
              Text("Konseling",
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
            child: const Text(
              "Instan",
              style: TextStyle(
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

  Widget _buildTotalPrice() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Harga",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: MyFont.fontMontserrat),
          ),
          Text(
            "Rp.80.000",
            style: TextStyle(
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
