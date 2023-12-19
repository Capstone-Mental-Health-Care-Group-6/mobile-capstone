import 'package:carousel_slider/carousel_slider.dart';
import 'package:empathi_care/view/screen/payment_method_screen.dart';
import 'package:empathi_care/view_model/profile_psikolog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePsikologScreen extends StatefulWidget {
  const ProfilePsikologScreen({
    super.key,
    required bool isInstan,
    required int session,
    required this.doctorId,
  });

  final int doctorId;

  @override
  State<ProfilePsikologScreen> createState() => _ProfilePsikologScreenState();
}

class _ProfilePsikologScreenState extends State<ProfilePsikologScreen> with TickerProviderStateMixin {
  final _carouselController = CarouselController();

  late AnimationController _animateControllerNext;
  late AnimationController _animateControllerPrev;
  DateTime? firstDate, lastDate;

  List<Map<String, dynamic>> listKeahlian = [
    {"keahlian": "Keluarga", "icon": "assets/icons/home_icon.svg"},
    {"keahlian": "Percintaan", "icon": "assets/icons/love_icon.svg"},
    {"keahlian": "Kendali Emosi", "icon": "assets/icons/flame_icon.svg"},
  ];

  late ProfilePsikologProvider prov;
  @override
  void initState() {
    _animateControllerNext = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animateControllerPrev = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    getCalledar();

    prov = context.read<ProfilePsikologProvider>();
    prov.init(context, widget.doctorId);
    super.initState();
  }

  getCalledar() {
    firstDate = DateTime.now().subtract(const Duration(days: 15));
    lastDate = DateTime.now().add(const Duration(days: 15));
  }

  @override
  void dispose() {
    _animateControllerNext.dispose();
    _animateControllerPrev.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Profile Psikolog",
            style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Consumer<ProfilePsikologProvider>(
          builder: (context, profileProv, child) {
            return profileProv.isLoading
                ? shimmerLoadingInstan()
                : Column(
                    children: [
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 20),
                          children: [
                            Container(
                              width: double.infinity,
                              height: 160,
                              color: const Color(0xffCCE7FF),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Image(
                                  image: NetworkImage(
                                    prov.dataDoctor['doctor_avatar'].toString(),
                                  ),
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 19.5, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          prov.dataDoctor['doctor_name'].toString(),
                                          style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        MdiIcons.star,
                                        color: const Color(0xffFFBB00),
                                        size: 24,
                                      ),
                                      const SizedBox(
                                        width: 3.5,
                                      ),
                                      Text(
                                        prov.avgRating.toString(),
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Therapy, positive psychology",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Tentang",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 7),
                                  Text(
                                    prov.dataDoctor['doctor_description'].toString(),
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Nomor Izin Praktik",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    prov.dataDoctor['doctor_sipp'] == "" ? "SIPP : -" : "SIPP : ${prov.dataDoctor['doctor_sipp']}",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  profileProv.isInstan
                                      ? Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Jadwal yang tersedia",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "${prov.workday.length} Jadwal Tersedia",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 7),
                                            GridView.builder(
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 3),
                                              itemCount: prov.workday.length,
                                              itemBuilder: (context, indexGrid) {
                                                return InkWell(
                                                  onTap: () {
                                                    profileProv.onSelectWorkday(profileProv.workday[indexGrid], 0);
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xffCCE7FF),
                                                      borderRadius: BorderRadius.circular(12),
                                                      border: profileProv.selectedWorkday[0]['workday']['workday_id'].toString() == profileProv.workday[indexGrid]['workday_id'].toString()
                                                          ? Border.all(color: Colors.blue)
                                                          : null,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Text(
                                                          DateFormat("HH:mm", "id_ID").format(DateTime.parse(profileProv.workday[indexGrid]['start_time'].toString())),
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold,
                                                            color: profileProv.selectedWorkday[0]['workday']['workday_id'].toString() == profileProv.workday[indexGrid]['workday_id'].toString()
                                                                ? Colors.blue
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          " - ",
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold,
                                                            color: profileProv.selectedWorkday[0]['workday']['workday_id'].toString() == profileProv.workday[indexGrid]['workday_id'].toString()
                                                                ? Colors.blue
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                        Text(
                                                          DateFormat("HH:mm", "id_ID").format(DateTime.parse(profileProv.workday[indexGrid]['end_time'].toString())),
                                                          style: GoogleFonts.montserrat(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.bold,
                                                            color: profileProv.selectedWorkday[0]['workday']['workday_id'].toString() == profileProv.workday[indexGrid]['workday_id'].toString()
                                                                ? Colors.blue
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : premiumMethod(),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Keahlian",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 4),
                                    itemCount: listKeahlian.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        child: Center(
                                            child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              listKeahlian[index]['icon'],
                                            ),
                                            const SizedBox(width: 2),
                                            Text(
                                              listKeahlian[index]['keahlian'].toString(),
                                              style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Review",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          _carouselController.previousPage();
                                        },
                                        child: const Icon(Icons.arrow_back_ios),
                                      ),
                                      const SizedBox(width: 4),
                                      InkWell(
                                        onTap: () {
                                          _carouselController.nextPage();
                                        },
                                        child: const Icon(Icons.arrow_forward_ios),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            prov.dataDoctor['ratings'] != null
                                ? CarouselSlider(
                                    carouselController: _carouselController,
                                    options: CarouselOptions(
                                      aspectRatio: 2,
                                      scrollPhysics: const BouncingScrollPhysics(),
                                      initialPage: 0,
                                      enableInfiniteScroll: true,
                                      enlargeCenterPage: true,
                                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval: const Duration(seconds: 12),
                                      autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      viewportFraction: 0.88,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: (index, reason) {
                                        _animateControllerPrev.reset();
                                        _animateControllerPrev.forward();
                                        _animateControllerNext.reset();
                                        _animateControllerNext.forward();
                                      },
                                    ),
                                    items: profileProv.ratings
                                        .map(
                                          (element) => Container(
                                            padding: const EdgeInsets.all(10),
                                            margin: const EdgeInsets.symmetric(horizontal: 10),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffCCE7FF),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: NetworkImage(element['patient_avatar'].toString()),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            element['patient_name'].toString(),
                                                            style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
                                                          ),
                                                          const SizedBox(height: 4),
                                                          Text(
                                                            "time",
                                                            style: GoogleFonts.montserrat(fontSize: 14),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 14),
                                                    Icon(MdiIcons.star, color: Colors.yellow, size: 24),
                                                    const SizedBox(width: 3.5),
                                                    Text(
                                                      element['doctor_star_rating'].toString(),
                                                      style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  element['doctor_review'].toString(),
                                                  maxLines: 4,
                                                  textAlign: TextAlign.justify,
                                                  style: GoogleFonts.montserrat(fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList())
                                : SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: Center(
                                      child: Text(
                                        "No Review",
                                        style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19.5),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: Size(MediaQuery.of(context).size.width, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "Mulai Chat",
                              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            )),
                      )
                    ],
                  );
          },
        ));
  }

  Widget shimmerLoadingInstan() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                width: double.infinity,
                height: 140,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.5),
                  child: Container(
                    width: double.infinity,
                    height: 140,
                    color: const Color(0xffCCE7FF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.5, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 167,
                          height: 14,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xffCCE7FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 24,
                              color: const Color(0xffCCE7FF),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3.5,
                        ),
                        SizedBox(
                          width: 23,
                          height: 12,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 140,
                              decoration: BoxDecoration(
                                color: const Color(0xffCCE7FF),
                                borderRadius: BorderRadius.circular(17.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 143,
                      height: 8.75,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 52,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    SizedBox(
                      width: double.infinity,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    SizedBox(
                      width: double.infinity,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    SizedBox(
                      width: double.infinity,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    SizedBox(
                      width: double.infinity,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.5),
                    SizedBox(
                      width: double.infinity,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 115,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 88,
                      height: 8.75,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    prov.isInstan
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 131,
                                    height: 10.5,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.5),
                                      highlightColor: Colors.white.withOpacity(0.5),
                                      child: Container(
                                        width: double.infinity,
                                        height: 10.5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffCCE7FF),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 88,
                                    height: 6.75,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.5),
                                      highlightColor: Colors.white.withOpacity(0.5),
                                      child: Container(
                                        width: double.infinity,
                                        height: 10.5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffCCE7FF),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 3),
                                itemCount: 3,
                                itemBuilder: (context, indexGrid) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffCCE7FF),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: 65,
                                        height: 8.75,
                                        child: Shimmer.fromColors(
                                          baseColor: Colors.grey.withOpacity(0.5),
                                          highlightColor: Colors.white.withOpacity(0.5),
                                          child: Container(
                                            width: double.infinity,
                                            height: 10.5,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffCCE7FF),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, indexList) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 10.5,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.5),
                                      highlightColor: Colors.white.withOpacity(0.5),
                                      child: Container(
                                        width: double.infinity,
                                        height: 10.5,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffCCE7FF),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.5),
                                      highlightColor: Colors.white.withOpacity(0.5),
                                      child: Container(
                                        width: double.infinity,
                                        height: 10.5,
                                        color: const Color(0xffCCE7FF),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 13),
                                ],
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 54,
                      height: 10.5,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 3),
                      itemCount: 3,
                      itemBuilder: (context, indexGrid) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 65,
                              height: 8.75,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.5),
                                highlightColor: Colors.white.withOpacity(0.5),
                                child: Container(
                                  width: double.infinity,
                                  height: 10.5,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffCCE7FF),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 45,
                          height: 10.5,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 10.5,
                              decoration: BoxDecoration(
                                color: const Color(0xffCCE7FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 10.5,
                              color: const Color(0xffCCE7FF),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 10.5,
                              color: const Color(0xffCCE7FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffCCE7FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 10.5,
                              decoration: BoxDecoration(
                                color: const Color(0xffCCE7FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 129,
                                height: 10.5,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.5),
                                  child: Container(
                                    width: double.infinity,
                                    height: 10.5,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffCCE7FF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: 50,
                                height: 8.75,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey.withOpacity(0.5),
                                  highlightColor: Colors.white.withOpacity(0.5),
                                  child: Container(
                                    width: double.infinity,
                                    height: 10.5,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffCCE7FF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 14),
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 10.5,
                              decoration: BoxDecoration(
                                color: const Color(0xffCCE7FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 3.5),
                        SizedBox(
                          width: 9,
                          height: 12.5,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.5),
                            highlightColor: Colors.white.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 10.5,
                              color: const Color(0xffCCE7FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 8.75,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.75),
                    SizedBox(
                      width: double.infinity,
                      height: 8.75,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3.75),
                    SizedBox(
                      width: double.infinity,
                      height: 8.75,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.5),
                        child: Container(
                          width: double.infinity,
                          height: 10.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.5),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              fixedSize: Size(MediaQuery.of(context).size.width, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: SizedBox(
              width: 65,
              height: 8.75,
              child: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white,
                child: Container(
                  width: double.infinity,
                  height: 10.5,
                  decoration: BoxDecoration(
                    color: const Color(0xffCCE7FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  ListView premiumMethod() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: prov.session,
      itemBuilder: (context, indexList) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Konseling ${indexList + 1}",
              style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: firstDate!,
                  lastDate: lastDate!,
                ).then((value) {
                  if (value != null) {
                    final dateTime = DateTime.parse(value.toString());
                    final dateIndo = DateFormat("dd/MM/yyyy", "id_ID").format(dateTime);

                    prov.onSelectedDate(indexList, dateIndo);
                  }
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: prov.selectedDate[indexList] == "" ? "mm/dd/yyyy" : prov.selectedDate[indexList].toString(),
                suffixIcon: Icon(
                  MdiIcons.calendar,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 13),
            Visibility(
              visible: prov.selectedDate[indexList] != "",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jadwal yang tersedia",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${prov.workday.length} Jadwal Tersedia",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 3),
                    itemCount: prov.workday.length,
                    itemBuilder: (context, indexGrid) {
                      return InkWell(
                        onTap: () {
                          prov.onSelectWorkday(prov.workday[indexGrid], indexList);
                          // log(prov.selectedWorkday[indexGrid]['workday']['workday_id'].toString());
                          // log(prov.workday[indexGrid]['workday_id'].toString());
                          // log(prov.selectedWorkday.toString());

                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(12),
                            border: prov.selectedWorkday[indexList]['workday']['workday_id'].toString() == prov.workday[indexGrid]['workday_id'].toString() ? Border.all(color: Colors.blue) : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat("HH:mm", "id_ID").format(DateTime.parse(prov.workday[indexGrid]['start_time'].toString())),
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: prov.selectedWorkday[indexList]['workday']['workday_id'].toString() != prov.workday[indexGrid]['workday_id'].toString() ? Colors.black : Colors.blue,
                                ),
                              ),
                              Text(
                                " - ",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: prov.selectedWorkday[indexList]['workday']['workday_id'].toString() != prov.workday[indexGrid]['workday_id'].toString() ? Colors.black : Colors.blue,
                                ),
                              ),
                              Text(
                                DateFormat("HH:mm", "id_ID").format(DateTime.parse(prov.workday[indexGrid]['end_time'].toString())),
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: prov.selectedWorkday[indexList]['workday']['workday_id'].toString() != prov.workday[indexGrid]['workday_id'].toString() ? Colors.black : Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
