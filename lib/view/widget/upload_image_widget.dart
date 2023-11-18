import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 198.0,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1.0),
      ),
      alignment: Alignment.center,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(
          8.0,
        ),
        dashPattern: const [4.0, 4.0],
        child: SizedBox(
          width: 328.0,
          height: 174.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/download.svg',
                  width: 34.0,
                  height: 34.0,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'or',
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 120.0,
                  height: 40.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                      backgroundColor: const Color(0xff0085FF),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Select file',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Recommended Image Size 300x450. Only Accept: jpg,png.jpeg.',
                  style: GoogleFonts.montserrat(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff666666),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
