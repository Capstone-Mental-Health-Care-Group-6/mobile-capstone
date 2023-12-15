import 'package:empathi_care/view/widget/card_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi',
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0, left: 16.0),
            child: Text('Terbaru',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600, fontSize: 16)),
          ),
          const CardNotificationWidget(isAlreadySeen: false),
          const CardNotificationWidget(isAlreadySeen: true),
          const CardNotificationWidget(isAlreadySeen: true),
        ],
      ),
    );
  }
}
