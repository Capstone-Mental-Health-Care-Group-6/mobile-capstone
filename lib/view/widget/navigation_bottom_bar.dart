import 'package:empathi_care/view_model/navigator_provider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:provider/provider.dart';

Widget buildBottomNavigationBar(BuildContext context) {
  final navigationProvider =
      Provider.of<NavigationProvider>(context, listen: false);

  return FlashyTabBar(
    animationCurve: Curves.linear,
    iconSize: 30,
    showElevation: true,
    selectedIndex: navigationProvider.currentIndex,
    onItemSelected: (index) {
      navigationProvider.setIndex(index);
    },
    items: [
      FlashyTabBarItem(
        icon: InkWell(
          onTap: () {
            navigationProvider.setIndex(0);
          },
          child: Icon(
            Icons.home,
            color: navigationProvider.currentIndex == 0
                ? Colors.blue
                : Color(0xff9496c1),
          ),
        ),
        title: Text(
          'Beranda',
          style: TextStyle(
            color: navigationProvider.currentIndex == 0
                ? Colors.blue
                : Color(0xff9496c1),
          ),
        ),
      ),
      FlashyTabBarItem(
        icon: InkWell(
          onTap: () {
            navigationProvider.setIndex(1);
          },
          child: Image.asset(
            "assets/images/icon_article.png",
            color: navigationProvider.currentIndex == 1
                ? Colors.blue
                : Color(0xff9496c1),
            width: 50,
          ),
        ),
        title: Text(
          'Konseling',
          style: TextStyle(
            color: navigationProvider.currentIndex == 1
                ? Colors.blue
                : Color(0xff9496c1),
          ),
        ),
      ),
      FlashyTabBarItem(
        icon: InkWell(
          onTap: () {
            navigationProvider.setIndex(2);
          },
          child: Image.asset(
            "assets/images/icon_bubble_chat.png",
            color: navigationProvider.currentIndex == 2
                ? Colors.blue
                : Color(0xff9496c1),
            width: 50,
          ),
        ),
        title: Text(
          'Chating',
          style: TextStyle(
            color: navigationProvider.currentIndex == 2
                ? Colors.blue
                : Color(0xff9496c1),
          ),
        ),
      ),
      FlashyTabBarItem(
        icon: InkWell(
          onTap: () {
            navigationProvider.setIndex(3);
          },
          child: Image.asset(
            "assets/images/icon_arrow_clock.png",
            color: navigationProvider.currentIndex == 3
                ? Colors.blue
                : Color(0xff9496c1),
            width: 50,
          ),
        ),
        title: Text(
          'Riwayat',
          style: TextStyle(
            color: navigationProvider.currentIndex == 3
                ? Colors.blue
                : Color(0xff9496c1),
          ),
        ),
      ),
      FlashyTabBarItem(
        icon: InkWell(
          onTap: () {
            navigationProvider.setIndex(4);
          },
          child: Image.asset(
            "assets/images/icon_profile.png",
            color: navigationProvider.currentIndex == 4
                ? Colors.blue
                : Color(0xff9496c1),
            width: 50,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: navigationProvider.currentIndex == 4
                ? Colors.blue
                : Color(0xff9496c1),
          ),
        ),
      ),
    ],
  );
}
