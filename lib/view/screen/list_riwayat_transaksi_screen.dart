import 'package:empathi_care/utils/constant/date.dart';
import 'package:flutter/material.dart';

class ListRiwayatTransaksi extends StatelessWidget {
  const ListRiwayatTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transaksi saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          buildListDokter(
              "assets/Dokter 1.png",
              "Rangga S.Psi., M.Psi",
              "Rp.50.000",
              getFormattedDateRiwayat(DateTime(2023, 10, 26, 19, 30)),
              true),
          buildListDokter(
              "assets/Dokter 2.png",
              "Melani S.Psi., M.Psi",
              "Rp.40.000",
              getFormattedDateRiwayat(DateTime(2023, 03, 21, 18, 00)),
              true),
          buildListDokter(
              "assets/Dokter 3.png",
              "Seto Mulyadi S.Psi., M.Psi",
              "Rp.50.000",
              getFormattedDateRiwayat(DateTime(2023, 02, 20, 20, 30)),
              true),
          buildListDokter(
              "assets/Dokter 4.png",
              "Roslina Vearuli S.Psi., M.Psi",
              "Rp.50.000",
              getFormattedDateRiwayat(DateTime(2023, 01, 16, 19, 30)),
              false)
        ],
      )),
    );
  }

  Widget buildListDokter(
      String img, String name, String harga, String tgl, bool berirating) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(tgl.toString()),
          ),
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Image.asset(img, height: 80, width: 80),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Text(harga)
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text('Spesialis psikolog',
                      style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Konsultasi Selesai',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: berirating
                              ? const Color(0xFF0085FF)
                              : const Color(0xFFFFBB00),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      onPressed: () {
                        if (berirating) {
                        } else {}
                      },
                      child: Text(
                        berirating ? "Detail" : "Beri Rating",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
