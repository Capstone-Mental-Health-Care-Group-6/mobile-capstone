import 'package:flutter/material.dart';

class ShowDialogEnd extends StatefulWidget {
  const ShowDialogEnd({super.key});

  @override
  State<ShowDialogEnd> createState() => _ShowDialogEndState();
}

class _ShowDialogEndState extends State<ShowDialogEnd> {
  @override
  Widget build(BuildContext context){
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12))
      ),
      // contentPadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0)
          ),
          color: Color(0xFFCCE7FF),
        ),
        height: 40,
        child: const Center(
          child: Text(
            "Sesi konsultasi telah berakhir",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      titlePadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              textAlign: TextAlign.center,
              '"Sesi konsultasi telah berakhir karena waktu sesi telah habis. Anda dapat mengakses kembali riwayat percakapan dengan dokter melalui halam riwayat konsultasi"',
              style: TextStyle(
                fontSize: 12
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              backgroundColor: const Color.fromARGB(255, 0, 133, 255)
            ),
            onPressed: Navigator.of(context).pop, 
            child: const Text(
              "Tutup",
              style: TextStyle(
                color: Colors.white
              ),
            )
          )
        ],
      )
    );
  }
}