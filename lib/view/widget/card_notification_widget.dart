import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardNotificationWidget extends StatefulWidget {
  const CardNotificationWidget({super.key, required this.isAlreadySeen});

  final bool isAlreadySeen;

  @override
  State<CardNotificationWidget> createState() => _CardNotificationWidgetState();
}

class _CardNotificationWidgetState extends State<CardNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: widget.isAlreadySeen ? Colors.white : const Color(0xFFCED8FC),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/information.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xFF6C8AF7), BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15.0),
                decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFB8B8B8)))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Info',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF959595),
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Konseling Instant',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Ingat konseling instant terbaru mu! Sambil baca Artikel jadi lebih berpengetahuan di EmphatiCare - ',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '23 Okt 2023',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: const Color(0xFF959595),
                          ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
