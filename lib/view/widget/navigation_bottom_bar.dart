import 'package:empathi_care/view_model/navigator_provider.dart';
// import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildBottomNavigationBar(BuildContext context) {
  final navigationProvider =
      Provider.of<NavigationProvider>(context, listen: false);

  return BottomNavigationBar(
    currentIndex: navigationProvider.currentIndex,
    onTap: (index) {
      navigationProvider.setIndex(index);
    },
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    iconSize: 30,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.article),
        label: 'Konseling',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chating',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_time),
        label: 'Riwayat',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_pin),
        label: 'Profile',
      ),
    ],
  );
}
