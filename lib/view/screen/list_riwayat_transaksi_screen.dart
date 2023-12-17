import 'package:empathi_care/utils/constant/date.dart';
import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:empathi_care/view/screen/HistoryTransactions/detail_transaction.dart';
import 'package:flutter/material.dart';

class ListRiwayatTransaksi extends StatelessWidget {
  const ListRiwayatTransaksi({super.key});

  @override
<<<<<<< HEAD
=======
  State<ListRiwayatTransaksi> createState() => _ListRiwayatTransaksiState();
}

class _ListRiwayatTransaksiState extends State<ListRiwayatTransaksi> {
  @override
  void initState() {
    super.initState();
    Provider.of<RiwayatTransaksiProvider>(context, listen: false).getData();
  }

  @override
>>>>>>> development
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Riwayat Pemesanan",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: MyFont.fontMontserrat),
        ),
        surfaceTintColor: Colors.white,
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
<<<<<<< HEAD
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          buildListDokter(
              "assets/images/Dokter 1.png",
              "Rangga S.Psi., M.Psi",
              "Rp.50.000",
              getFormattedDateRiwayat(DateTime(2023, 10, 26, 19, 30)),
              true, context),
          buildListDokter(
              "assets/images/Dokter 2.png",
              "Melani S.Psi., M.Psi",
              "Rp.40.000",
              getFormattedDateRiwayat(DateTime(2023, 03, 21, 18, 00)),
              true, context),
          buildListDokter(
              "assets/images/Dokter 3.png",
              "Seto Mulyadi S.Psi., M.Psi",
              "Rp.50.000",
              getFormattedDateRiwayat(DateTime(2023, 02, 20, 20, 30)),
              true, context),
          buildListDokter(
              "assets/images/Dokter 4.png",
              "Roslina Vearuli S.Psi., M.Psi",
              "Rp.50.000",
              getFormattedDateRiwayat(DateTime(2023, 01, 16, 19, 30)),
              false, context)
        ],
      )),
    );
  }

  Widget buildListDokter(
      String img, String name, String harga, String tgl, bool berirating, BuildContext context) {
=======
        body: FutureBuilder<RiwayatTransaksi>(
          future: riwayatTransaksiProvider.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final riwayatTransaksi = snapshot.data!;
              return riwayatTransaksi.message!.contains("data")
                  ? const RiwayatPemesananIsnone()
                  : ListView.builder(
                      itemCount: riwayatTransaksi.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return buildListDokter(
                            riwayatTransaksi.data![index], context);
                      },
                    );
            }
          },
        ));
  }

  Widget buildListDokter(
      DataRiwayatTransaksi transaction, BuildContext context) {
        final riwayatTransaksiProvider =
        Provider.of<RiwayatTransaksiProvider>(context, listen: false);

    final tgl = transaction.createdAt != null
        ? getFormattedDateRiwayat(transaction.createdAt!)
        : '';
    final img = transaction.doctorAvatar ?? '';
    final name = transaction.doctorName ?? '';
    final harga = formatRupiah(transaction.priceResult);
    final berirating = transaction.doctorStarRating! > 0;
    riwayatTransaksiProvider.setId(transaction.transactionId ?? '');
    riwayatTransaksiProvider.addata();
>>>>>>> development
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(tgl.toString(),
                style: const TextStyle(
                    fontFamily: MyFont.fontMontserrat,
                    fontWeight: FontWeight.w600)),
          ),
          ListTile(
            leading: ClipOval(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Image.asset(img),
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      harga,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(
                    'Spesialis psikolog',
                    style: TextStyle(fontSize: 12),
                  ),
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
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    berirating
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_)=> const DetailTransaction()));
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                                vertical: 10,
                              ),
                              backgroundColor: const Color(0xFF0085FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "Detail",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: MyFont.fontMontserrat,
                              ),
                            ),
                          )
                        : OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFF0085FF),
                                width: 1.3,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Beri Rating",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontFamily: MyFont.fontMontserrat,
                              ),
                            ),
                          ),
                  ]),
                )
              ],
            ),
            contentPadding: const EdgeInsets.only(left: 10, right: 15),
          ),
          Container(
            padding: EdgeInsets.zero,
            height: 1.2,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}