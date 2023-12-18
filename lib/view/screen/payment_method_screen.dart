import 'package:dio/dio.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:empathi_care/model/payment_method_model.dart';
import 'package:empathi_care/view/screen/Register/terms_screen.dart';
import 'package:empathi_care/view/screen/payment/pembayaran_manual_screen.dart';
import 'package:empathi_care/view/screen/web_view_gopay_payment_screen.dart';
import 'package:empathi_care/view/widget/card_invoice_widget.dart';
import 'package:empathi_care/view/widget/card_method_payment.dart';
import 'package:empathi_care/view/widget/card_psikolog_on_payment_method.dart';
import 'package:empathi_care/view_model/transaction_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isManualPayment = true;
  bool isCheckTermCondition = false;
  List<PaymentMethodModel> paymentMethods =
      PaymentMethodModel.getListManualPayment();
  late PaymentMethodModel _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    _selectedPaymentMethod = paymentMethods[0];
  }

  @override
  Widget build(BuildContext context) {
    final transactionViewModel =
        Provider.of<TransactionViewModel>(context, listen: false);

    void makeTransaction() async {
      if (isCheckTermCondition) {
        debugPrint(_selectedPaymentMethod.name);
        if (_selectedPaymentMethod.type == 'manual') {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => PembayaranManualScreen(
                        isManualPayment: true,
                        manualPaymentMethod: _selectedPaymentMethod.name,
                      )));
        } else {
          try {
            await transactionViewModel.makeMidtransTransaction(
                topicId: 1,
                patientId: 2,
                methodId: 1,
                durationId: 1,
                counselingId: 1,
                counselingSession: 1,
                counselingType: "A",
                priceMethod: 125000,
                priceCounseling: 300000,
                priceDuration: 60000,
                paymentType: _selectedPaymentMethod.name.toLowerCase(),
                doctorId: 13);

            if (mounted) {
              debugPrint(_selectedPaymentMethod.name);
              if (_selectedPaymentMethod.name == 'Gopay') {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const WebViewGopayPaymentScreen()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PembayaranManualScreen(
                              isManualPayment: false,
                            )));
              }
            }
          } on DioException catch (e) {
            debugPrint(e.response.toString());
            if (e.response != null) {
              final snackBar = SnackBar(
                content: Text('${e.response?.data['message']}'),
                backgroundColor: const Color(0XFF0085FF),
              );

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          }
        }
      } else {
        const snackBar = SnackBar(
          content: Text(
            'Syarat dan ketentuan belum disetujui',
          ),
          backgroundColor: Color(0XFF0085FF),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran',
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: ListView(
          children: [
            timeLine(),
            const SizedBox(height: 25),
            const CardPsikologOnPaymentMethod(),
            const SizedBox(height: 15),
            const CardInvoicePayment(),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Metode Pembayaran',
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    Text('Yuk pilih cara bayar yang kamu mau',
                        style: GoogleFonts.montserrat(fontSize: 12))
                  ],
                ),
                const SizedBox(height: 15),
                switcherPaymentMethod(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    for (PaymentMethodModel paymentMethod in paymentMethods)
                      CardMethodPayment(
                        label: paymentMethod.name,
                        groupValue: _selectedPaymentMethod,
                        value: paymentMethod,
                        logo: paymentMethod.logo,
                        onChanged: (PaymentMethodModel currentPaymentMethod) {
                          setState(() {
                            _selectedPaymentMethod = currentPaymentMethod;
                          });
                        },
                      ),
                  ],
                ),
                Row(
                  children: [
                    Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0))), // Rounded Checkbox
                          value: isCheckTermCondition,
                          onChanged: (inputValue) {
                            setState(() {
                              isCheckTermCondition = inputValue!;
                            });
                          },
                        )),
                    Expanded(
                      child: RichText(
                          text: TextSpan(
                              text: 'Saya telah membaca dan menyetujui ',
                              style:
                                  GoogleFonts.montserrat(color: Colors.black),
                              children: [
                            TextSpan(
                              text: 'syarat dan ketentuan',
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xFF6C8AF7)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Feedback.forTap(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const TermsScreen(),
                                    ),
                                  );
                                },
                            )
                          ])),
                    ),
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Biaya',
                    style: GoogleFonts.montserrat(),
                  ),
                  Text('Rp 80.000',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700, fontSize: 18))
                ],
              ),
              Consumer<TransactionViewModel>(builder: (context, value, child) {
                return SizedBox(
                  width: 170,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          Colors.white, //change background color of button
                      backgroundColor:
                          const Color(0xFF0085FF), //change text color of button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: !value.isLoading ? makeTransaction : null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 0),
                      child: value.isLoading
                          ? Container(
                              width: 24,
                              height: 24,
                              padding: const EdgeInsets.all(2.0),
                              child: const CircularProgressIndicator(
                                color: Color(0xFF0085FF),
                                strokeWidth: 3,
                              ),
                            )
                          : Text(
                              'Bayar Sekarang',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget switcherPaymentMethod() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xffCCE7FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isManualPayment = true;
                    paymentMethods = PaymentMethodModel.getListManualPayment();
                    _selectedPaymentMethod = paymentMethods[0];
                  });
                },
                child: Container(
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: isManualPayment
                      ? BoxDecoration(
                          color: const Color(0xff0085FF),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  child: Center(
                      child: Text(
                    "Manual Transfer",
                    style: GoogleFonts.montserrat(
                        color: isManualPayment ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isManualPayment = false;
                    paymentMethods = PaymentMethodModel.getListPaymentGateway();
                    _selectedPaymentMethod = paymentMethods[0];
                  });
                },
                child: Container(
                  // padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: !isManualPayment
                      ? BoxDecoration(
                          color: const Color(0xff0085FF),
                          borderRadius: BorderRadius.circular(8),
                        )
                      : null,
                  child: Center(
                      child: Text(
                    "Payment Gateway",
                    style: GoogleFonts.montserrat(
                        color: !isManualPayment ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget timeLine() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const Expanded(
                child: DottedLine(
                  alignment: WrapAlignment.center,
                  dashColor: Colors.blue,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              const Expanded(
                child: DottedLine(
                  dashColor: Colors.blue,
                ),
              ),
              Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Paket",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            "Psikolog",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
          Text(
            "Bayar",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    ],
  );
}
