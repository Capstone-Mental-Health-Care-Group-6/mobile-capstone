// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardPsikologWidget extends StatefulWidget {
  String image;
  String nama;
  String spesialis;
  String? pengalaman;
  String? metode;
  String? topik;
  String textButton;
  String? likePercent;
  String? comment;
  String? masaAktif;
  bool? selesai;
  CardPsikologWidget({
    super.key,
    required this.image,
    required this.nama,
    required this.spesialis,
    required this.textButton,
    this.metode,
    this.pengalaman,
    this.topik,
    this.likePercent,
    this.comment,
    this.masaAktif,
    this.selesai,
  });

  @override
  State<CardPsikologWidget> createState() => _CardPsikologWidgetState();
}

class _CardPsikologWidgetState extends State<CardPsikologWidget> {
  String imagePsikolog = '', namaPsikolog = '', spesialisPsikolog = '', textButton = '', percent = '', comment = '', masaAktif = '', metode = '', topik = '', pengalaman = '';
  bool selesai = false;

  @override
  void initState() {
    imagePsikolog = widget.image;
    namaPsikolog = widget.nama;
    spesialisPsikolog = widget.spesialis;
    textButton = widget.textButton;
    percent = widget.likePercent ?? "";
    comment = widget.comment ?? "";
    masaAktif = widget.masaAktif ?? "";
    metode = widget.metode ?? "";
    pengalaman = widget.pengalaman ?? "";
    topik = widget.topik ?? "";
    selesai = widget.selesai ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return listPsikolog(imagePsikolog, namaPsikolog, spesialisPsikolog, textButton);
  }

  Widget listPsikolog(String? image, String? nama, String? spesialis, String? textButton) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaPsikolog,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      spesialisPsikolog,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 3),
                    pengalaman != ""
                        ? Text(
                            pengalaman,
                            style: const TextStyle(fontSize: 14),
                          )
                        : metode != "" && topik != ""
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    metode,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    topik,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              )
                            : Container(),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Visibility(
                  visible: percent != "",
                  child: const Row(
                    children: [
                      Icon(
                        Icons.thumbs_up_down,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "69%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.rate_review,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "3200",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: masaAktif != "",
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xff54C438),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "Masa Aktif $masaAktif Hari",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                Visibility(
                  visible: selesai,
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Konsultasi Selesai",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(textButton!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
