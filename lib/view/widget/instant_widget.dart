import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstantWidget extends StatefulWidget {
  const InstantWidget({Key? key}) : super(key: key);

  @override
  State<InstantWidget> createState() => _InstantWidgetState();
}

class _InstantWidgetState extends State<InstantWidget> {
  final List<String> categories = [
    'Semua',
    'Aktif',
    'Selesai',
  ];
  int selectedIndex = 0;
  final List<Map<String, String>> listPaket = [
    {
      "image": "assets/images/doctorsEllipse2.png",
      "doctorName": 'Rangga S.Psi., M.Psi',
      "specialist": 'Spesialis Psikolog',
      'method': 'Metode Chat instan',
      'topic': 'Topik Stress',
      'status': 'Percakapan Masih dibuka',
      'textButton': 'Mulai Chat',
      'statusDoctor': 'online',
    },
    {
      'image': 'assets/images/doctorsEllipse1.png',
      'doctorName': 'Melani S,psi., M,Psi',
      'specialist': 'Spesialis Psikolog',
      'method': 'Metode Chat instan',
      'topic': 'Topik Stress',
      'status': 'Percakapan sudah ditutup',
      'textButton': 'Chat Kembali',
      'statusDoctor': 'sibuk',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 13.0,
          ),
          child: SizedBox(
            height: 36.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    width: 68.0,
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? const Color(0xff0085FF)
                          : const Color(0xffCCE7FF),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: index == selectedIndex
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        selectedIndex == 0
            ? cardInstant(listPaket)
            : selectedIndex == 1
                ? cardInstant(listPaket
                    .where((element) =>
                        element['status'] == 'Percakapan Masih dibuka')
                    .toList())
                : selectedIndex == 2
                    ? cardInstant(listPaket
                        .where((paket) =>
                            paket['status'] == 'Percakapan sudah ditutup')
                        .toList())
                    : const SizedBox(),
      ],
    );
  }

  Widget cardInstant(List<Map<String, String>> listPaket) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listPaket.length,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 150.0,
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 1.0,
                offset: Offset(0.0, 1.0),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                ),
                child: ListTile(
                  leading: Container(
                    width: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Stack(
                      textDirection: TextDirection.rtl,
                      children: [
                        Center(
                          child: SizedBox(
                            width: 60.0,
                            height: 60.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                30.0,
                              ),
                              child: Image.asset(
                                listPaket[index]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(
                            2.9,
                          ),
                          padding: const EdgeInsets.all(
                            1.5,
                          ),
                          height: 9.0,
                          width: 9.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: listPaket[index]['statusDoctor'] ==
                                      'online'
                                  ? Colors.green
                                  : listPaket[index]['statusDoctor'] == 'sibuk'
                                      ? const Color(0xffFFF311)
                                      : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    listPaket[index]['doctorName']!,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                  titleAlignment: ListTileTitleAlignment.top,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        listPaket[index]['specialist']!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                          color: const Color(0xff323232),
                        ),
                      ),
                      Text(
                        listPaket[index]['method']!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                          color: const Color(0xff323232),
                        ),
                      ),
                      Text(
                        listPaket[index]['topic']!,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                          color: const Color(0xff323232),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 152.0,
                      height: 20.0,
                      padding: const EdgeInsets.only(
                        top: 3.0,
                      ),
                      decoration: BoxDecoration(
                        color: listPaket[index]['status'] ==
                                'Percakapan Masih dibuka'
                            ? const Color(0xff54C438)
                            : const Color(0xff959595),
                        borderRadius: BorderRadius.circular(
                          4.0,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          listPaket[index]['status']!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                    listPaket[index]['status'] == 'Percakapan Masih dibuka'
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff0085FF),
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              listPaket[index]['textButton']!,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  8.0,
                                ),
                              ),
                              side: const BorderSide(
                                color: Color(0xff0085FF),
                              ),
                              foregroundColor: const Color(0xff0085FF),
                            ),
                            onPressed: () {},
                            child: Text(
                              listPaket[index]['textButton']!,
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
