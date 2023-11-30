import 'package:flutter/material.dart';

class KonselingScreen extends StatefulWidget {
  const KonselingScreen({super.key});

  @override
  State<KonselingScreen> createState() => _KonselingScreenState();
}

class _KonselingScreenState extends State<KonselingScreen> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Konseling",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            height: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 35, right: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alur Konseling",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          "Ingin tau lebih lanjut ? ",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "Baca Selengkapnya",
                          style: TextStyle(fontWeight: FontWeight.w500),
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
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0085FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: const Size(120, 45)),
                        onPressed: () {
                          _showOptionsDialog(context);
                        },
                        child: const Text(
                          "Mulai Sekarang",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
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
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
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
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) async {
    List<String> options = [
      "Pekerjaan",
      "Kendali Emosi",
      "Percintaan",
      "Pendidikan",
      "Keluarga",
      "Kecanduan",
      "Kesepian",
      'Sosial',
      "Lainnya",
    ];

    await showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
                buildPilihTopik(
                    "Pilih Topik",
                    "Permasalahan apa yang ingin anda diskusikan ?",
                    "assets/images/Select-rafiki 2.png"),
                const Divider(
                  thickness: 2,
                  color: Color(0xff6C8AF7),
                )
              ],
            ),
            contentPadding: const EdgeInsets.only(left: 15, right: 15),
            content: SizedBox(
              width: double.maxFinite,
              height: 200,
              child: Scrollbar(
                controller: ScrollController(),
                child: ListView(
                  shrinkWrap: true,
                  itemExtent: 35,
                  children: options.map((option) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio<String>(
                              value: option,
                              groupValue: selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value;
                                });
                              },
                              activeColor: Colors.black,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            option,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            actionsPadding: const EdgeInsets.only(right: 15, bottom: 10),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: const Color(0xFF0085FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(100, 38)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Pilih Topik",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
            ],
            insetPadding: const EdgeInsets.all(20),
          );
        },
      ),
    );
  }
}
