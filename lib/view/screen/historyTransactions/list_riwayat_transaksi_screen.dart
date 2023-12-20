import 'package:empathi_care/model/riwayat_transaksi_model.dart';
import 'package:empathi_care/utils/constant/currency.dart';
import 'package:empathi_care/utils/constant/date.dart';
import 'package:empathi_care/utils/constant/font_family.dart';
import 'package:empathi_care/view/screen/historyTransactions/detail_transaction.dart';
import 'package:empathi_care/view/screen/counseling/riwayat_transaksi_isnone.dart';
import 'package:empathi_care/view_model/riwayat_transaksi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListRiwayatTransaksi extends StatefulWidget {
  const ListRiwayatTransaksi({super.key});

  @override
  State<ListRiwayatTransaksi> createState() => _ListRiwayatTransaksiState();
}

class _ListRiwayatTransaksiState extends State<ListRiwayatTransaksi> {
  @override
  void initState() {
    super.initState();
    Provider.of<RiwayatTransaksiProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final riwayatTransaksiProvider =
        Provider.of<RiwayatTransaksiProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Riwayat Pemesanan",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: MyFont.fontMontserrat),
          ),
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
        body: FutureBuilder<RiwayatTransaksi>(
          future: riwayatTransaksiProvider.getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
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
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(img),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTransaction(
                                        transactionId:
                                            transaction.transactionId!)),
                              );
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailTransaction(
                                        transactionId:
                                            transaction.transactionId!)),
                              );
                            },
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
