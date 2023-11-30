import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePsikologScreen extends StatefulWidget {
  final bool isInstan;
  final DateTime? dateKonseling;
  final int? session;
  const ProfilePsikologScreen({
    Key? key,
    required this.isInstan,
    this.dateKonseling,
    this.session,
  }) : super(key: key);

  @override
  State<ProfilePsikologScreen> createState() => _ProfilePsikologScreenState();
}

class _ProfilePsikologScreenState extends State<ProfilePsikologScreen> with TickerProviderStateMixin {
  final _carouselController = CarouselController();

  int session = 0;

  late AnimationController _animateControllerNext;
  late AnimationController _animateControllerPrev;
  DateTime? firstDate, lastDate;
  List<Map<String, dynamic>> selectedSchedule = [];
  List<String> selectedDate = [];
  bool isInstan = false, isLoading = true;
  Map<String, List> scheduleList = {};
  List<String> listKeahlian = [
    "Keluarga",
    "Percintaan",
    "Kendali Emosi",
  ];
  List<Map<String, dynamic>> listReview = [
    {
      "name": "Naufal rafi shafgani",
      'time': "2 hari lalu",
      "rating": "5",
      "review": "Dokter sangat hebat! Terima kasih telah memberi saya saran yang luar biasa dan telah membantu saya melalui masalah yang sangat berat. Terima kasih dok.",
    },
    {
      "name": "Abdul",
      'time': "3 hari lalu",
      "rating": "4",
      "review": "Dokter sangat hebat! Terima kasih telah memberi saya saran yang luar biasa dan telah membantu saya melalui masalah yang sangat berat. Terima kasih dok.",
    },
    {
      "name": "Dhea",
      'time': "5 hari lalu",
      "rating": "4.5",
      "review": "Dokter sangat hebat! Terima kasih telah memberi saya saran yang luar biasa dan telah membantu saya melalui masalah yang sangat berat. Terima kasih dok.",
    },
  ];
  @override
  void initState() {
    isInstan = widget.isInstan;
    _animateControllerNext = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animateControllerPrev = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    session = widget.session ?? 0;

    getJadwal();
    getCalledar();
    countList();
    super.initState();
  }

  Future loading() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) => isLoading = false);
  }

  countList() async {
    for (int i = 0; i < session; i++) {
      selectedDate.add("");
    }

    if (isInstan) {
      selectedSchedule.add({"date": "", "selected": false});
    }

    await Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
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

  List getJadwal() {
    setState(() {
      isLoading = true;
    });
    if (isInstan) {
      return scheduleList['date'] = [
        "9.30 - 10.00",
        "13.30 - 14.00",
        "15.30 - 16.00",
      ];
    } else {
      return [];
    }
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
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return shimmerLoadingInstan();
          } else {
            return FadeInLeft(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140,
                          color: const Color(0xffCCE7FF),
                          child: const Align(
                            alignment: Alignment.bottomCenter,
                            child: Image(image: AssetImage("assets/doctors.png")),
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
                                  Text(
                                    "Rangga S.Psi., M.Psi",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    MdiIcons.star,
                                    color: const Color(0xffFFBB00),
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 3.5,
                                  ),
                                  Text(
                                    "4.8",
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
                                "Dr. Rangga S adalah seorang profesional psikologi yang berpengalaman dengan latar belakang pendidikan yang kuat, memegang gelar Sarjana Psikologi (S.Psi) dan Magister Psikologi (M.Psi). Dengan lebih dari sepuluh tahun pengalaman praktik, Dr. Rangga telah menjadi seorang ahli dalam konseling keluarga dan terapi individu.",
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
                                "SIPP : 3232323232",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 20),
                              isInstan
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
                                              "${scheduleList['date']?.length} Jadwal Tersedia",
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
                                          itemCount: scheduleList["date"]?.length,
                                          itemBuilder: (context, indexGrid) {
                                            return InkWell(
                                              onTap: () {
                                                selectedSchedule[0]['date'] = scheduleList["date"]![indexGrid].toString();
                                                selectedSchedule[0]['selected'] = true;
                                                setState(() {});
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffCCE7FF),
                                                  borderRadius: BorderRadius.circular(12),
                                                  border: selectedSchedule[0]['date'] == scheduleList["date"]![indexGrid].toString() ? Border.all(color: Colors.blue) : null,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  scheduleList["date"]![indexGrid].toString(),
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: selectedSchedule[0]['date'] == scheduleList["date"]![indexGrid].toString() ? Colors.blue : Colors.black,
                                                  ),
                                                )),
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
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, childAspectRatio: 3),
                                itemCount: listKeahlian.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xffCCE7FF),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                        child: Text(
                                      listKeahlian[index].toString(),
                                      style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold),
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
                        CarouselSlider(
                            carouselController: _carouselController,
                            options: CarouselOptions(
                              aspectRatio: 3,
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
                            items: listReview
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
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/image_psikolog.png"),
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
                                                    element['name'].toString(),
                                                    style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    element['time'],
                                                    style: GoogleFonts.montserrat(fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            Icon(MdiIcons.star, color: Colors.yellow, size: 24),
                                            const SizedBox(width: 3.5),
                                            Text(
                                              element['rating'],
                                              style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          element['review'],
                                          textAlign: TextAlign.justify,
                                          style: GoogleFonts.montserrat(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList()),
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
                        child: Text(
                          "Mulai Chat",
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
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
                    isInstan
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
                                  Visibility(
                                    visible: selectedDate[indexList] != "",
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
                                              "${scheduleList['date${indexList + 1}']?.length} Jadwal Tersedia",
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
                                          itemCount: scheduleList["date${indexList + 1}"]?.length,
                                          itemBuilder: (context, indexGrid) {
                                            return Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xffCCE7FF),
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                scheduleList["date${indexList + 1}"]![indexGrid].toString(),
                                                style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.bold),
                                              )),
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
      itemCount: 2,
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
                    selectedDate[indexList] = dateIndo;
                    scheduleList["date${indexList + 1}"] = [
                      "9.30 - 10.00",
                      "13.30 - 14.00",
                      "15.30 - 16.00",
                    ];
                    selectedSchedule.add({"date": "", "selected": false});
                    log(selectedSchedule.toString());
                    setState(() {});
                  }
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: selectedDate[indexList] == "" ? "mm/dd/yyyy" : selectedDate[indexList].toString(),
                suffixIcon: Icon(
                  MdiIcons.calendar,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 13),
            Visibility(
              visible: selectedDate[indexList] != "",
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
                        "${scheduleList['date${indexList + 1}']?.length} Jadwal Tersedia",
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
                    itemCount: scheduleList["date${indexList + 1}"]?.length,
                    itemBuilder: (context, indexGrid) {
                      return InkWell(
                        onTap: () {
                          selectedSchedule[indexList]['date'] = scheduleList["date${indexList + 1}"]![indexGrid].toString();
                          selectedSchedule[indexList]['selected'] = true;
                          log(selectedSchedule.toString());
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffCCE7FF),
                            borderRadius: BorderRadius.circular(12),
                            border: selectedSchedule[indexList]['date'] == scheduleList["date${indexList + 1}"]![indexGrid].toString() ? Border.all(color: Colors.blue) : null,
                          ),
                          child: Center(
                              child: Text(
                            scheduleList["date${indexList + 1}"]![indexGrid].toString(),
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: selectedSchedule[indexList]['date'] != scheduleList["date${indexList + 1}"]![indexGrid].toString() ? Colors.black : Colors.blue,
                            ),
                          )),
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
