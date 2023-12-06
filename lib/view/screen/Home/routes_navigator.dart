import 'package:empathi_care/view/screen/OnBoarding/screen_dua.dart';
import 'package:empathi_care/view/screen/Profile/profile_screen.dart';
import 'package:empathi_care/view/screen/active_package_screen.dart';
import 'package:empathi_care/view/screen/home_screen.dart';
import 'package:empathi_care/view/screen/list_riwayat_transaksi_screen.dart';
import 'package:empathi_care/view/widget/navigation_bottom_bar.dart';
import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: navigationProvider.currentIndex,
        children: const [
          HomeScreen(),
          ScreenDua(),
          ActivePacketScreen(),
          ListRiwayatTransaksi(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
