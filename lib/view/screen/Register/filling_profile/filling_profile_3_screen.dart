import 'package:empathi_care/view/screen/Register/filling_profile/filling_profile_4_screen.dart';
import 'package:empathi_care/view/widget/timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FillingProfile3 extends StatefulWidget {
  const FillingProfile3({super.key});

  @override
  State<FillingProfile3> createState() => _FillingProfile1State();
}

class _FillingProfile1State extends State<FillingProfile3> {
  final datectl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime selectDate = DateTime.now();
  final currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TimeLine1(
              index: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 25),
              child: Text(
                'Tanggal Lahir',
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
              child: TextFormField(
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  selectDate = (await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(1990),
                    lastDate: DateTime.now(),
                  ))!;
                  datectl.text = DateFormat('dd MMMM yyyy').format(selectDate);
                },
                controller: datectl,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 17),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          selectDate = (await showDatePicker(
                            context: context,
                            initialDate: currentDate,
                            firstDate: DateTime(1990),
                            lastDate: DateTime.now(),
                          ))!;
                          datectl.text =
                              DateFormat('dd MMMM yyyy').format(selectDate);
                        },
                        child: const Icon(
                          Icons.calendar_month_outlined,
                          size: 24,
                          color: Color(0xff636363),
                        ),
                      ),
                    ),
                    label: const Text('Tanggal Lahir')),
                style: GoogleFonts.montserrat(
                    fontSize: 15, fontWeight: FontWeight.w500),
                validator: (value) {
                  if (value! == '') {
                    return 'Tanggal Lahir Masih Kosong';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.96),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 12),
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Color.fromRGBO(0, 0, 0, 0.20),
                        offset: Offset(0, 4))
                  ]),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(370, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0XFF0085FF),
                          foregroundColor: Colors.white),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const FillingProfile4()));
                        }
                      },
                      child: Text(
                        'Selanjutnya',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
