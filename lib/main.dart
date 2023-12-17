import 'package:empathi_care/view/screen/splash_screen.dart';
import 'package:empathi_care/view_model/chat_bot_cs_view_model.dart';
import 'package:empathi_care/view_model/count_down_payment_success_view_model.dart';
import 'package:empathi_care/view_model/enabled_button_provider.dart';
import 'package:empathi_care/view_model/filling_provider.dart';
import 'package:empathi_care/view_model/password_provider.dart';
import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:empathi_care/view_model/payment_method_view_model.dart';
import 'package:empathi_care/view_model/transaction_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

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
          ChangeNotifierProvider<NavigationProvider>(
            create: (create) => NavigationProvider(),
          ),
          ChangeNotifierProvider(
              create: (BuildContext context) => FillingProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ChatBotCSProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => EnabledButton()),
          ChangeNotifierProvider(
              create: (BuildContext context) => PaymentMethodViewModel()),
          ChangeNotifierProvider(
              create: (BuildContext context) => TransactionViewModel()),
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
