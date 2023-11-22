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
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.25),
            height: 1,
          ),
        ),
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 20, top: 15),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Riwayat Pemesanan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3),
                child: Text(
                  "Konsultasi online dengan dokter kami",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            buildListDokter(
                "assets/Dokter 1.png", "Rangga S.Psi., M.Psi", "Rp.50.000",getFormattedDateRiwayat(DateTime(2023, 10, 26, 19, 30))),
            buildListDokter(
                "assets/Dokter 2.png", "Melani S.Psi., M.Psi", "Rp.40.000",getFormattedDateRiwayat(DateTime(2023, 03, 21, 18, 00))),
            buildListDokter(
                "assets/Dokter 3.png", "Seto Mulyadi S.Psi., M.Psi", "Rp.50.000",getFormattedDateRiwayat(DateTime(2023, 02, 20, 20, 30))),
                buildListDokter(
                "assets/Dokter 4.png", "Roslina Vearuli S.Psi., M.Psi", "Rp.50.000",getFormattedDateRiwayat(DateTime(2023, 01, 16, 19, 30)))
          ],
        )
      ]),
    );
  }

  Widget buildListDokter(
    String img,
    String name,
    String harga,
    String tgl
  ) {
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
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0085FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            minimumSize: const Size(120, 45)),
                        onPressed: () {},
                        child: const Text(
                          "Detail",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ))
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

    ;
  }
}
