import 'package:empathi_care/view/widget/card_konseling_widgets.dart';
import 'package:empathi_care/view_model/zoom_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ZoomScreen extends StatefulWidget {
  const ZoomScreen({
    super.key,
    required this.doctorId,
  });
  final int? doctorId;

  @override
  State<ZoomScreen> createState() => _ZoomScreenState();
}

class _ZoomScreenState extends State<ZoomScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ZoomViewModel>(context, listen: false)
        .getDataFromApi(widget.doctorId!);
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ZoomViewModel>(context, listen: false);
    debugPrint('${widget.doctorId}');
    final String? linkGmeet = prov.zooModel?.data?.doctorMeetLink;
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ZoomViewModel>(
          builder: (context, prov, _) {
            return Text(
              '${prov.zooModel?.data?.doctorName}',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: Colors.black,
              ),
            );
          },
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            color: const Color(0xff323232),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            offset: const Offset(
              0,
              kToolbarHeight,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'laporkan',
                  child: Center(
                    child: Text(
                      'Laporkan',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 'sesi_berakhir',
                  child: Center(
                    child: Text(
                      'Akhiri Sesi',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 'sesi_berakhir') {
                showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                      ),
                      backgroundColor: Colors.white,
                      child: SizedBox(
                        height: 220.0,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffCCE7FF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                    16.0,
                                  ),
                                  topRight: Radius.circular(
                                    16.0,
                                  ),
                                ),
                              ),
                              width: double.infinity,
                              height: 45.0,
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                'Permintaan untuk mengakhiri sesi konsultasi',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              'Waktu anda sisa : 20 menit 30 detik',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 10.0,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              '"Sesi konsultasi akan diakhiri oleh dokter, Anda dapat mengakses kembali riwayat percakapan dengan dokter melalui halaman riwayat konsultasi."',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                              ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              'Apakah masalahnya sudah terselesaikan?',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                25.0,
                                14.0,
                                25.0,
                                8.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 85.0,
                                    height: 35.0,
                                    child: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        side: const BorderSide(
                                          color: Color(0xff0085FF),
                                        ),
                                        foregroundColor:
                                            const Color(0xff0085FF),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Belum nih',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 154.0,
                                    height: 35.0,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12.0,
                                          ),
                                        ),
                                        padding: EdgeInsets.zero,
                                        backgroundColor:
                                            const Color(0xff0085FF),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        ' Sudah terselesaikan :) ',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 140.0,
              child: Consumer<ZoomViewModel>(
                builder: (context, prov, _) {
                  final String? doctorAvatar =
                      prov.zooModel?.data?.doctorAvatar;
                  debugPrint('$doctorAvatar');
                  return doctorAvatar != null
                      ? Image(
                          image: NetworkImage(
                            doctorAvatar,
                          ),
                          fit: BoxFit.fill,
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                12.0,
                16.0,
                12.0,
                16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '"Harap diingat bahwa ketika Anda berkonsultasi dengan dokter, itu adalah percakapan pribadi yang hanya Anda dan dokter yang tahu. Kami mendorong Anda untuk berbicara terbuka dan jujur dengan dokter tanpa perlu cemas. Semoga Anda selalu dalam keadaan sehat!"',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'Konsultasi Via Gmeet',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ID rapat',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '232303',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pascode',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        '@Alta-Chan#',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Informasi Jadwal',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    'Mohon pastikan Anda hadir tepat waktu untuk konsultasi.',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Consumer<ZoomViewModel>(
                    builder: (context, prov, _) {
                      String formattedString = '';
                      final String? date = prov.zooModel?.data?.date;
                      if (date != null) {
                        final DateTime formatDate = DateTime.parse(date);
                        formattedString = prov.formattedDate(formatDate);
                      } else {
                        formattedString = '${prov.zooModel?.data?.date}';
                      }
                      return CardKonselingWidgets(
                        title: 'Konseling 1',
                        date: formattedString,
                        time: '10.30-11.00',
                        textButton: prov.isMeetingOpened
                            ? "Sesi Berakhir"
                            : "Mulai Sekarang",
                        onPressed: () => prov.openGmeet(linkGmeet!),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    '(*) Jadwal, topik, dan Tanggal bersifat absolut ( Tidak dapat berubah-ubah)',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0,
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
}
