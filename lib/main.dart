import 'package:empathi_care/view/screen/splash_screen.dart';
import 'package:empathi_care/view_model/artikel_rekomendasi_view_model.dart';
import 'package:empathi_care/view_model/chat_bot_cs_view_model.dart';
import 'package:empathi_care/view_model/count_down_payment_success_view_model.dart';
import 'package:empathi_care/view_model/detail_history_transaction_view_model.dart';
import 'package:empathi_care/view_model/delete_viewmodel.dart';
import 'package:empathi_care/view_model/enabled_button_provider.dart';
import 'package:empathi_care/view_model/filling_provider.dart';
import 'package:empathi_care/view_model/get_patient_by_id_view_model.dart';
import 'package:empathi_care/view_model/paket_view_model.dart';
import 'package:empathi_care/view_model/konseling_view_model.dart';
import 'package:empathi_care/view_model/password_provider.dart';
import 'package:empathi_care/view_model/psikolog_view_model.dart';
import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:empathi_care/view_model/rating_and_review_view_model.dart';
import 'package:empathi_care/view_model/update_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:empathi_care/view_model/riwayat_transaksi_view_model.dart';

void main() {
  initializeDateFormatting('id', null).then((_) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => PasswordProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  CountDownPaymentSuccessProvider()),
          ChangeNotifierProvider(create: (context) => ArticleProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => NavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => FillingProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => PaketProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => NavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => FillingProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ChatBotCSProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => EnabledButton()),
          ChangeNotifierProvider(
              create: (BuildContext context) => RiwayatTransaksiProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => PsikologProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => KonselingProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => GetPatientByIdViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  DetailHistoryTransactionViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => RatingAndReviewViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => UpdateProfileViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => InactivatePatientViewModel()),
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0XFF0085FF)),
              useMaterial3: true,
              fontFamily: GoogleFonts.montserrat().fontFamily,
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            home: const SplashScreen(),
          );
        });
  }
}
