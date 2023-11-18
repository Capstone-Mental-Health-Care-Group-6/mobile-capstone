// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardKonselingWidget extends StatefulWidget {
  String title;
  String tanggal;
  String jamMulai;
  String jamSelsai;
  bool selsai;
  VoidCallback? onPressed;

  CardKonselingWidget({
    Key? key,
    required this.title,
    required this.tanggal,
    required this.jamMulai,
    required this.jamSelsai,
    required this.selsai,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CardKonselingWidget> createState() => _CardKonselingWidgetState();
}

class _CardKonselingWidgetState extends State<CardKonselingWidget> {
  String title = '', tanggal = '', jamMulai = '', jamSelsai = '';
  bool selesai = false;
  VoidCallback? onPressed;

  @override
  void initState() {
    title = widget.title;
    tanggal = widget.tanggal;
    jamMulai = widget.jamMulai;
    jamSelsai = widget.jamSelsai;
    selesai = widget.selsai;
    onPressed = widget.onPressed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: const Color(0xffCCE7FF),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Divider(thickness: 2),
            Row(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      tanggal,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "$jamMulai - $jamSelsai",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: !selesai ? Colors.blue : Colors.white,
                  side: selesai ? const BorderSide(color: Colors.blue) : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  disabledBackgroundColor: Colors.white,
                ),
                onPressed: !selesai ? onPressed : null,
                child: Text(
                  !selesai ? "Mulai Sekarang" : "Sesi Berakhir",
                  style: TextStyle(
                    color: !selesai ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
