import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardKonselingWidgets extends StatelessWidget {
  const CardKonselingWidgets( 
      {super.key,
      required this.title,
      required this.date,
      required this.time,
      required this.textButton, required this.onPressed,});

  final String title;
  final String date;
  final String time;
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 172.0,
      child: Card(
        color: const Color(0xffCCE7FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Divider(
                color: const Color(0xff0085FF).withAlpha(50),
                thickness: 1.0,
                endIndent: 15.0,
                indent: 15.0,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 14.0,
                  ),
                  const Icon(
                    Icons.calendar_today_rounded,
                    size: 24.0,
                    color: Color(0xFF1E90FF),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    date,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      color: const Color(0xff4A4A4A),
                    ),
                  ),
                  const SizedBox(
                    width: 110.0,
                  ),
                  const Icon(
                    Icons.access_time,
                    color: Color(0xff1E90FF),
                    size: 24.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    time,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      color: const Color(0xff4A4A4A),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: textButton == 'Mulai Sekarang'
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0085FF),
                          shadowColor: const Color(0xff000000).withOpacity(0.1),
                          side: const BorderSide(color: Color(0xff0085FF)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                          ),
                        ),
                        onPressed: onPressed,
                        child: Text(
                          textButton,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            side: const BorderSide(color: Color(0xff0085FF))),
                        onPressed: () {},
                        child: Text(
                          textButton,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.0,
                            color: const Color(0xff0085FF),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
