import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildBottomNavigationBar(BuildContext context) {
  final navigationProvider =
      Provider.of<NavigationProvider>(context, listen: false);

  return FlashyTabBar(
    animationCurve: Curves.linear,
    iconSize: 30,
    showElevation: false,
    selectedIndex: navigationProvider.currentIndex,
    onItemSelected: (index) {
      navigationProvider.setIndex(index);
    },
    items: [
      FlashyTabBarItem(
        icon: const Icon(Icons.home),
        title: const Text('Beranda'),
      ),
      FlashyTabBarItem(
        icon: const Icon(Icons.article),
        title: const Text('Konseling'),
      ),
      FlashyTabBarItem(
        icon: const Icon(Icons.chat),
        title: const Text('Chating'),
      ),
      FlashyTabBarItem(
        icon: const Icon(Icons.access_time),
        title: const Text('Riwayat'),
      ),
      FlashyTabBarItem(
        icon: const Icon(Icons.person_pin),
        title: const Text('Profile'),
      ),
    ],
  );
}
