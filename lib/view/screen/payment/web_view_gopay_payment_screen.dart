import 'package:empathi_care/view/screen/payment/success_verification_screen.dart';
import 'package:empathi_care/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewGopayPaymentScreen extends StatefulWidget {
  const WebViewGopayPaymentScreen({super.key});

  @override
  State<WebViewGopayPaymentScreen> createState() =>
      _WebViewGopayPaymentScreenState();
}

class _WebViewGopayPaymentScreenState extends State<WebViewGopayPaymentScreen> {
  late final TransactionViewModel transactionViewModel;

  @override
  void initState() {
    transactionViewModel =
        Provider.of<TransactionViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(
          transactionViewModel.detailMidtransTransaction?.data.callbackUrl ??
              ''));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gopay Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const SuccessVerificationScreen(),
          )),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
