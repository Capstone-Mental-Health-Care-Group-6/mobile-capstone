import 'package:empathi_care/view/screen/konseling_screen.dart';
import 'package:empathi_care/view/screen/riwayat_transaksi_isnone.dart';
import 'package:empathi_care/view/widget/card_invoice_widget.dart';
import 'package:empathi_care/view/widget/count_down_payment_widget.dart';
import 'package:empathi_care/view/widget/pop_up_payment_widget.dart';
import 'package:empathi_care/view_model/count_down_payment_success_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting('id', null).then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => CountDownPaymentSuccessProvider()),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        title: 'Flutter Demo',
        home: const KonselingScreen());
  }
}
