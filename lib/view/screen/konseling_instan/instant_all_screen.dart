import 'package:empathi_care/view/widget/button_text_filter_widget.dart';
import 'package:empathi_care/view/widget/card_all_counseling_widget.dart';
import 'package:empathi_care/view_model/instant_counseling_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InstantAllScreen extends StatelessWidget {
  const InstantAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InstantCounselingProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Konseling',
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  10.0,
                ),
                child: ButtonTextFilterWidget(),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(child: CardAllWidgetInstant())
            ],
          ),
        );
      },
    );
  }
}
