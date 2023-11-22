import 'package:empathi_care/view_model/instant_counseling_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ButtonTextFilterWidget extends StatelessWidget {
  const ButtonTextFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InstantCounselingProvider>(
      builder: (context, instantProv, child) {
        return SizedBox(
          height: 36.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: instantProv.textFilter.length,
            itemBuilder: (context, index) {
              final textFilters = instantProv.textFilter[index];
              return GestureDetector(
                onTap: () {
                  instantProv.selectIndexInstant(index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  width: 68.0,
                  decoration: BoxDecoration(
                    color: index == instantProv.selectIndex
                        ? Color(0xff0085FF)
                        : Color(0xffCCE7FF),
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      textFilters,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: index == instantProv.selectIndex
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
