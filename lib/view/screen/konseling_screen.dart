import 'package:empathi_care/model/konseling_model.dart';
import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:empathi_care/view/screen/paket_screen.dart';
import 'package:empathi_care/view_model/konseling_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class KonselingScreen extends StatefulWidget {
  const KonselingScreen({super.key});

  @override
  State<KonselingScreen> createState() => _KonselingScreenState();
}

class _KonselingScreenState extends State<KonselingScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<KonselingProvider>(context, listen: false)
        .fetchTopikKonseling();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Buat Janji",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontFamily: MyFont.fontMontserrat),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 185, 185, 185),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0.2,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Alur Konseling",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: MyFont.fontMontserrat),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        const Text(
                          "Ingin tau lebih lanjut ? ",
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: MyFont.fontMontserrat,
                              color: Color(0xff636363)),
                        ),
                        InkWell(
                          onTap: () {
                            _showAlurKonseling(context);
                          },
                          child: const Text(
                            "Baca Selengkapnya",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: MyFont.fontMontserrat,
                                color: Color(0xff6C8AF7),
                                fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                buildListAlurKonseling(
                    "Topik Konseling",
                    "Pilih Topik masalah yang ingin kamu ceritakan ke psikolog",
                    "assets/images/icon list.png"),
                buildListAlurKonseling(
                    "Alur Detail layanan Konseling",
                    "Pilih paket, sesi, metode, durasi dan psikolog",
                    "assets/images/icon phone.png"),
                buildListAlurKonseling(
                    "Konfirmasi Jadwal & Pembayaran",
                    "Pilih jadwal yang tersedia dari psikolog pilihanmu, dan lakukan pembayaran",
                    "assets/images/icon konfirm.png")
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              height: 110,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFCCE7FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Ceritakan masalahmu dengan psikolog profesional",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          fontFamily: MyFont.fontMontserrat),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        _showOptionsDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        backgroundColor: const Color(0xFF0085FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Mulai Sekarang",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: MyFont.fontMontserrat,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildListAlurKonseling(String title, String subtitle, String img) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFCCE7FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                img,
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: MyFont.fontMontserrat),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.grey, fontFamily: MyFont.fontMontserrat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPilihTopik(String title, String subtitle, String img) {
    return Container(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Image.asset(
            img,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: MyFont.fontMontserrat),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 11, fontFamily: MyFont.fontMontserrat),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    final konselingProvider =
        Provider.of<KonselingProvider>(context, listen: false);

    void showOptionsDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: const EdgeInsets.only(left: 8),
              width: MediaQuery.of(context).size.width * 0.9,
              child:
                  Consumer<KonselingProvider>(builder: (context, value, child) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.zero,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: buildPilihTopik(
                        "Pilih Topik",
                        "Permasalahan apa yang ingin anda diskusikan ?",
                        "assets/images/Select-rafiki 2.png",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 15),
                      child: Divider(
                        thickness: 2.3,
                        color: Color(0xff6C8AF7),
                      ),
                    ),
                    SizedBox(
                      height: 205,
                      child: konselingProvider.topikKonseling.data?.isEmpty ==
                              true
                          ? const CircularProgressIndicator()
                          : ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemExtent: 38,
                              children: konselingProvider.topikKonseling.data
                                      ?.map((datum) {
                                    return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Row(
                                        children: [
                                          Transform.scale(
                                            scale: 1.2,
                                            child: Radio<String>(
                                              value: datum.name ?? "",
                                              groupValue: konselingProvider
                                                  .selectedOption,
                                              onChanged: (String? value) {
                                                konselingProvider
                                                    .setSelectedOption(value!);
                                                konselingProvider
                                                    .setSelectedId(datum.id!);
                                                    konselingProvider.getById();
                                              },
                                              activeColor: Colors.black,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              toggleable: true,
                                            ),
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            datum.name ?? "",
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList() ??
                                  [],
                            ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const PaketScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 10,
                              ),
                              backgroundColor: const Color(0xFF0085FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Pilih Topik",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          );
        },
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showOptionsDialog();
    });
  }

  void _showAlurKonseling(BuildContext context) {
    final konselingProvider =
        Provider.of<KonselingProvider>(context, listen: false);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 5,
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 8, left: 5),
                  child: Row(
                    children: [
                      const Text(
                        "Alur Konseling",
                        style: TextStyle(
                          fontFamily: MyFont.fontMontserrat,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final number = (index + 1).toString();
                    final text = konselingProvider.getTextForIndex(index);
                    return Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 13,
                            child: Text(
                              '$number.',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                text,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: MyFont.fontMontserrat,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
