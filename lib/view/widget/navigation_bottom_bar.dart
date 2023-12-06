import 'package:empathi_care/view_model/navigator_provider.dart';
// import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Widget buildBottomNavigationBar(BuildContext context) {
  final navigationProvider =
      Provider.of<NavigationProvider>(context, listen: false);

  return BottomNavigationBar(
    selectedLabelStyle:
        GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500),
    unselectedLabelStyle:
        GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500),
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
        icon: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: SvgPicture.asset(
            'assets/icons/Home_1.svg',
            colorFilter: navigationProvider.indexCurrent == 0
                ? const ColorFilter.mode(Color(0xff0085FF), BlendMode.srcIn)
                : ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.srcIn),
          ),
        ),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: SvgPicture.asset(
              'assets/icons/Article.svg',
              colorFilter: navigationProvider.indexCurrent == 1
                  ? const ColorFilter.mode(Color(0xff0085FF), BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )),
        label: 'Buat Janji',
      ),
      BottomNavigationBarItem(
        icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: SvgPicture.asset(
              'assets/icons/Konseling_Icon.svg',
              colorFilter: navigationProvider.indexCurrent == 2
                  ? const ColorFilter.mode(Color(0xff0085FF), BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )),
        label: 'Chating',
      ),
      BottomNavigationBarItem(
        icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: SvgPicture.asset(
              'assets/icons/History_Icon.svg',
              colorFilter: navigationProvider.indexCurrent == 3
                  ? const ColorFilter.mode(Color(0xff0085FF), BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )),
        label: 'Riwayat',
      ),
      BottomNavigationBarItem(
        icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 6),
            child: SvgPicture.asset(
              'assets/icons/profile-icon.svg',
              colorFilter: navigationProvider.indexCurrent == 4
                  ? const ColorFilter.mode(Color(0xff0085FF), BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )),
        label: 'Profile',
      ),
    ],
  );
}
