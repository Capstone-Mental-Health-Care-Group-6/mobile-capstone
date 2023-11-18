import 'package:empathi_care/view/screen/splash_screen.dart';
import 'package:empathi_care/view_model/logreg_provider.dart';
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
              create: (BuildContext context) => LogRegProvider())
        ],
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0XFF0085FF)),
              useMaterial3: true,
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