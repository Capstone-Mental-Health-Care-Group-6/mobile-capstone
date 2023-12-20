// ignore_for_file: unnecessary_null_comparison

import 'package:dotted_line/dotted_line.dart';
import 'package:empathi_care/view/screen/counseling/list_psikolog_instant.dart';
import 'package:empathi_care/view/screen/counseling/list_psikolog_premium.dart';
import 'package:empathi_care/view_model/paket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({super.key});

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {
  late PaketProvider paketProvider;
  @override
  void initState() {
    paketProvider = context.read<PaketProvider>();

    paketProvider.init(context);
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
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
        ),
        body: Consumer<PaketProvider>(
          builder: (context, paketProv, child) {
            return paketProv.isLoading
                ? shimmerLoading()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Stack(
                      children: [
                        ListView(
                          padding: const EdgeInsets.only(bottom: 20),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                timeLine(),
                                const SizedBox(height: 16),
                                Text(
                                  "Pilih Paket dan Metode",
                                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Pilihlah kombinasi paket dan bundle yang sesuai dengan kebutuhanmu.",
                                  style: GoogleFonts.montserrat(fontSize: 12),
                                ),
                                const SizedBox(height: 12),
                                Visibility(
                                  visible: !paketProv.isInstan,
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 10, right: 2, left: 2, bottom: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xff6C8AF7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 16),
                                          child: Text(
                                            "Mau ganti metode ? Klick \"Ganti\"",
                                            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xffCCE7FF),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: const Icon(
                                                    Icons.question_answer,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        paketProv.listMethods[paketProv.selectedMetode - 1]['name'].toString(),
                                                        style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        paketProv.listDuration[paketProv.selectedDuration - 1]['name'].toString(),
                                                        style: GoogleFonts.montserrat(fontSize: 14),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return modalSelectMetode();
                                                      },
                                                    ).then((value) => setState(
                                                          () {},
                                                        ));
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                    side: const BorderSide(color: Colors.blue),
                                                  ),
                                                  child: Text(
                                                    "Ganti",
                                                    style: GoogleFonts.montserrat(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
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
                                              paketProv.onChangeType(context);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              decoration: paketProv.isInstan
                                                  ? BoxDecoration(
                                                      color: const Color(0xff0085FF),
                                                      borderRadius: BorderRadius.circular(8),
                                                    )
                                                  : null,
                                              child: Center(
                                                  child: Text(
                                                "Instan",
                                                style: GoogleFonts.montserrat(color: paketProv.isInstan ? Colors.white : Colors.black, fontSize: 12),
                                              )),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap: () {
                                              paketProv.onChangeType(context);
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                              decoration: !paketProv.isInstan
                                                  ? BoxDecoration(
                                                      color: const Color(0xff0085FF),
                                                      borderRadius: BorderRadius.circular(8),
                                                    )
                                                  : null,
                                              child: Center(
                                                  child: Text(
                                                "Premium",
                                                style: GoogleFonts.montserrat(color: !paketProv.isInstan ? Colors.white : Colors.black, fontSize: 12),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: paketProv.listPaket.length,
                                      itemBuilder: (context, index) {
                                        return paketProv.listPaket != null
                                            ? Padding(
                                                padding: const EdgeInsets.only(top: 16),
                                                child: InkWell(
                                                  onTap: () {
                                                    paketProv.onSelectPaket(index);
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
                                                            color: index == paketProv.selectedPaket ? const Color.fromARGB(255, 21, 94, 153) : const Color(0xffCCE7FF),
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
                                                                child: Image.network(paketProv.listPaket[index]['avatar'].toString()),
                                                              ),
                                                              const SizedBox(width: 12),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                    paketProv.listPaket[index]['name'].toString(),
                                                                    style: TextStyle(fontSize: 16, color: index == paketProv.selectedPaket ? Colors.white : Colors.black),
                                                                  ),
                                                                  Text(
                                                                    "Rp ${NumberFormat('###,###,###,###', 'ID').format(
                                                                      double.parse(
                                                                        paketProv.listPaket[index]['price'].toString(),
                                                                      ),
                                                                    )} / ${paketProv.listPaket[index]['sessions']} Sesi",
                                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: index == paketProv.selectedPaket ? Colors.white : Colors.black),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(10),
                                                          child: Text(paketProv.listPaket[index]['description'].toString().replaceAll(", ", ",\n")),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const CircularProgressIndicator();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: paketProv.selectedPaket != null
                                  ? paketProv.isInstan
                                      ? () {
                                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ListPsikologInstant()));
                                          //instan
                                        }
                                      : () {
                                          Navigator.push(context, MaterialPageRoute(builder: (_) => const ListPsikologPremium()));
                                          //premium
                                        }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )),
                              child: Text(
                                "Pilih Paket",
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ));
  }

  Widget modalSelectMetode() {
    final provider = Provider.of<PaketProvider>(context);
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
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: paketProvider.listMethods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.7, crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0 && provider.selectedMetode == 2) {
                        provider.selectedMetode = 1;
                      } else if (index == 1 && provider.selectedMetode == 1) {
                        provider.selectedMetode = 2;
                      } else {
                        null;
                      }
                      setState(() {});
                    },
                    child: Container(
                      // padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        border: (provider.selectedMetode - 1) == index ? Border.all(color: Colors.blue) : null,
                        color: const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: (provider.selectedMetode - 1) == index ? Colors.blue : Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              index == 0 ? Icons.question_answer : MdiIcons.video,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            paketProvider.listMethods[index]['name'].toString(),
                            style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: (provider.selectedMetode - 1) == index ? Colors.blue : Colors.black),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 26),
              Text(
                "Berapa lama durasinya ?",
                style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: paketProvider.listDuration.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.7, crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0 && provider.selectedDuration == 2) {
                        provider.selectedDuration = 1;
                      } else if (index == 1 && provider.selectedDuration == 1) {
                        provider.selectedDuration = 2;
                      } else {
                        null;
                      }
                      setState(() {});
                    },
                    child: Container(
                      // padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        border: (provider.selectedDuration - 1) == index ? Border.all(color: Colors.blue) : null,
                        color: const Color(0xffCCE7FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          paketProvider.listDuration[index]['name'].toString(),
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: (provider.selectedDuration - 1) == index ? Colors.blue : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(MediaQuery.of(context).size.width, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "OK",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.white,
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
    final provider = Provider.of<PaketProvider>(context);
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
                                  // setState(() {
                                  //   provider.isInstan = !provider.isInstan;
                                  // });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: provider.isInstan
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
                                  // setState(() {
                                  //   provider.isInstan = !provider.isInstan;
                                  // });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: !provider.isInstan
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
