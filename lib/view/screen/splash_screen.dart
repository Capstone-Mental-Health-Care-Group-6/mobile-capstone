import 'package:empathi_care/view/screen/OnBoarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff0085ff), Color(0xff80c2ff)],
          stops: [0, 0.89],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: SvgPicture.asset('assets/image/EmpathiCare_Logo.svg'),
        ),
      ),
    );
  }
}
