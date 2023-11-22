import 'package:animate_do/animate_do.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shimmer/shimmer.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({super.key});

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {
  bool isInstan = true, isLoading = true;
  int? selectedPaket, selectedMetode, selectedDuration;

  List<Map<String, dynamic>> listPaket = [];
  Future<void> delayLoading() async {
    Future.delayed(Duration(seconds: 5)).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  addDataPaket() {
    setState(() {
      listPaket.clear();
    });
    if (isInstan) {
      listPaket = [
        {
          "title": "Paket Perkenalan",
          "price": "Rp. 80.000/1 Sesi",
          "images": "assets/icons/icons_doctor.svg",
          "profit": [
            "Metode Chat,Call,VidCall, atau Zoom",
            "Durasi 30 Menit",
          ],
        },
      ];
      setState(() {});
    } else {
      listPaket = [
        {
          "title": "Paket Perkenalan",
          "price": "Rp. 100.000/1 Sesi",
          "images": "assets/icons/icons_doctor.svg",
          "profit": [
            "Metode Chat,Call,VidCall, atau Zoom",
            "Jadwal bisa disesuaikan dengan kebutuhan",
            "Garansi Ganti Psikolog",
          ],
        },
        {
          "title": "Paket Bikin Nyaman",
          "price": "Rp. 150.000/2 Sesi",
          "images": "assets/icons/icons_hospital.svg",
          "profit": [
            "Metode Chat,Call,VidCall, atau Zoom",
            "Jadwal bisa disesuaikan dengan kebutuhan",
            "Garansi Ganti Psikolog",
            "Masa aktif paket 1 bulan",
          ],
        },
        {
          "title": "Paket Perkenalan",
          "price": "Rp. 200.000/4 Sesi",
          "images": "assets/icons/icons_select.svg",
          "profit": [
            "Metode Chat,Call,VidCall, atau Zoom",
            "Jadwal bisa disesuaikan dengan kebutuhan",
            "Garansi ganti psikolog",
            "Masa aktif paket 1 bulan",
          ],
        },
        {
          "title": "Paket Perkenalan",
          "price": "Rp. 200.000/4 Sesi",
          "images": "assets/icons/icons_select.svg",
          "profit": [
            "Metode Chat,Call,VidCall, atau Zoom",
            "Jadwal bisa disesuaikan dengan kebutuhan",
            "Garansi ganti psikolog",
            "Masa aktif paket 1 bulan",
          ],
        }
      ];
      setState(() {});
    }
  }

  @override
  void initState() {
    delayLoading();
    addDataPaket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paket",
          style: GoogleFonts.montserrat(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return shimmerLoading();
          } else {
            return FadeInLeft(
              duration: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    timeLine(),
                    const SizedBox(height: 16),
                    Text(
                      "Pilih Paket",
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Pilihlah kombinasi paket dan bundle yang sesuai dengan kebutuhanmu.",
                      style: GoogleFonts.montserrat(fontSize: 12),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  isInstan = true;
                                  addDataPaket();
                                  selectedPaket = null;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: isInstan
                                      ? BoxDecoration(
                                          color: const Color(0xff0085FF),
                                          borderRadius: BorderRadius.circular(8),
                                        )
                                      : null,
                                  child: Center(
                                      child: Text(
                                    "Instan",
                                    style: GoogleFonts.montserrat(color: isInstan ? Colors.white : Colors.black, fontSize: 12),
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  isInstan = false;
                                  selectedPaket = null;
                                  addDataPaket();
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: !isInstan
                                      ? BoxDecoration(
                                          color: const Color(0xff0085FF),
                                          borderRadius: BorderRadius.circular(8),
                                        )
                                      : null,
                                  child: Center(
                                      child: Text(
                                    "Premium",
                                    style: GoogleFonts.montserrat(color: !isInstan ? Colors.white : Colors.black, fontSize: 12),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listPaket.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: InkWell(
                                      onTap: () {
                                        selectedPaket = index;
                                        setState(() {});
                                      },
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: index == selectedPaket ? Color.fromARGB(255, 21, 94, 153) : Color(0xffCCE7FF),
                                                borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  topRight: Radius.circular(8),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: SvgPicture.asset(listPaket[index]['images']),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        listPaket[index]['title'],
                                                        style: TextStyle(fontSize: 16, color: index == selectedPaket ? Colors.white : Colors.black),
                                                      ),
                                                      Text(
                                                        listPaket[index]['price'],
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: index == selectedPaket ? Colors.white : Colors.black),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Builder(builder: (context) {
                                                    List profit = listPaket[index]['profit'];
                                                    return ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      itemCount: listPaket[index]['profit'].length,
                                                      itemBuilder: (context, index) {
                                                        return Padding(
                                                          padding: const EdgeInsets.only(top: 3),
                                                          child: Text(
                                                            "\u2022 ${profit[index].toString()}",
                                                            style: const TextStyle(fontSize: 14),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  })
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: isInstan
                            ? () {}
                            : () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return modalSelectMetode();
                                  },
                                );
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        child: Text(
                          "Pilih Paket",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget modalSelectMetode() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 8,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xffD4D4D4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Atur Metode & Durasi Konseling",
                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                "Psikolog akan ditampilkan berdasarkan durasi dan metode pilihan mu",
                style: GoogleFonts.montserrat(fontSize: 12),
              ),
              const SizedBox(height: 16),
              Text(
                "Mau konseling melalui apa ?",
                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectedMetode = 1;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                        decoration: BoxDecoration(
                          border: selectedMetode == 1 ? Border.all(color: Colors.blue) : null,
                          color: const Color(0xffCCE7FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.forum,
                              color: selectedMetode == 1 ? Colors.blue : Colors.black,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Chat",
                              style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: selectedMetode == 1 ? Colors.blue : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        selectedMetode = 2;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                        decoration: BoxDecoration(
                          border: selectedMetode == 2 ? Border.all(color: Colors.blue) : null,
                          color: const Color(0xffCCE7FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: selectedMetode == 2 ? Colors.blue : Colors.black,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                MdiIcons.video,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Zoom",
                              style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: selectedMetode == 2 ? Colors.blue : Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              Text(
                "Berapa lama durasinya ?",
                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      selectedDuration = 1;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        border: selectedDuration == 1 ? Border.all(color: Colors.blue) : null,
                        color: const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "60 Menit",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: selectedDuration == 1 ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      selectedDuration = 2;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        border: selectedDuration == 2 ? Border.all(color: Colors.blue) : null,
                        color: const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "90 Menit",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: selectedDuration == 2 ? Colors.blue : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 20),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () {},
                child: Text(
                  "Pilih Metode",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Padding shimmerLoading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SizedBox(
              width: double.infinity,
              // height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white.withOpacity(0.2),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DottedLine(
                      alignment: WrapAlignment.center,
                      dashColor: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white.withOpacity(0.2),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: DottedLine(
                      dashColor: Colors.grey.withOpacity(0.2),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white.withOpacity(0.2),
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
                height: 10,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.2),
                  child: Container(
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.5),
                          Colors.white.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 10,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.2),
                  child: Container(
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.5),
                          Colors.white.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
                height: 10,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.2),
                  child: Container(
                    width: 30,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.withOpacity(0.5),
                          Colors.white.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 85,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: Container(
                          height: 20,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.5),
                                Colors.white.withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 27,
                      width: double.infinity,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.5),
                        highlightColor: Colors.white.withOpacity(0.2),
                        child: Container(
                          height: 27,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                              colors: [
                                Colors.grey.withOpacity(0.5),
                                Colors.white.withOpacity(0.5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isInstan = !isInstan;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: isInstan
                                      ? BoxDecoration(
                                          color: const Color(0xff0085FF),
                                          borderRadius: BorderRadius.circular(8),
                                        )
                                      : null,
                                  child: Center(
                                    child: SizedBox(
                                      width: 47,
                                      height: 10,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.white.withOpacity(0.6),
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 30,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Colors.grey,
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isInstan = !isInstan;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: !isInstan
                                      ? BoxDecoration(
                                          color: const Color(0xff0085FF),
                                          borderRadius: BorderRadius.circular(8),
                                        )
                                      : null,
                                  child: Center(
                                    child: SizedBox(
                                      width: 47,
                                      height: 10,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.white.withOpacity(0.6),
                                        highlightColor: Colors.white,
                                        child: Container(
                                          width: 30,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            gradient: const LinearGradient(
                                              colors: [
                                                Colors.grey,
                                                Colors.white,
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(top: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(color: Color(0xffCCE7FF), borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(9))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 60,
                                      width: 60,
                                      child: SvgPicture.asset(
                                        "assets/icons/icons_loading.svg",
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10.5,
                                          width: 107,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey.withOpacity(0.3),
                                            highlightColor: Colors.white.withOpacity(0.4),
                                            child: Container(
                                              height: 107,
                                              width: 107,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Colors.grey,
                                                    Colors.white,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          height: 10.5,
                                          width: 107,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey.withOpacity(0.3),
                                            highlightColor: Colors.white.withOpacity(0.4),
                                            child: Container(
                                              height: 107,
                                              width: 107,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Colors.grey,
                                                    Colors.white,
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 5),
                                          child: SizedBox(
                                            height: 8.75,
                                            width: 81,
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey.withOpacity(0.3),
                                              highlightColor: Colors.white.withOpacity(0.4),
                                              child: Container(
                                                height: 8.75,
                                                width: 81,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(12),
                                                  gradient: const LinearGradient(
                                                    colors: [
                                                      Colors.grey,
                                                      Colors.white,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: SizedBox(
                height: 10.5,
                width: 107,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.4),
                  child: Container(
                    height: 107,
                    width: 107,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget timeLine() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            width: double.infinity,
            // height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: DottedLine(
                    alignment: WrapAlignment.center,
                    dashColor: Colors.grey.withOpacity(0.4),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: DottedLine(
                    dashColor: Colors.grey.withOpacity(0.4),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Paket",
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 10),
            ),
            Text(
              "Psikolog",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
            Text(
              "Bayar",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}