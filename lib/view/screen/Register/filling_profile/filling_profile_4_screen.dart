import 'package:dio/dio.dart';
import 'package:empathi_care/view/screen/Register/create_success_screen.dart';
import 'package:empathi_care/view/widget/timeline_widget.dart';
import 'package:empathi_care/view_model/filling_provider.dart';
import 'package:empathi_care/view_model/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FillingProfile4 extends StatefulWidget {
  const FillingProfile4({super.key});

  @override
  State<FillingProfile4> createState() => _FillingProfile1State();
}

class _FillingProfile1State extends State<FillingProfile4> {
  late RegisterViewModel registerViewModel;
  final gender = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List jenisKelamin = ['Laki-laki', 'Perempuan'];
  late FillingProvider fillingProvider = Provider.of(context, listen: false);
  @override
  void initState() {
    registerViewModel = Provider.of(context, listen: false);
    fillingProvider.itemStatus = List.generate(2, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void handleRegister() async {
      if (_formKey.currentState!.validate()) {
        registerViewModel.gender = gender.text;
        try {
          await registerViewModel.registerAuth();
          if (mounted) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const CreateSuccessAccountScreen()));
          }
        } on DioException catch (e) {
          if (e.response != null) {
            final snackBar = SnackBar(
              content: Text('${e.response?.data['message']}'),
              backgroundColor: const Color(0XFF0085FF),
            );
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        }
      }
    }

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
              index: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 25),
              child: Text(
                'Apa jenis kelaminmu?',
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Consumer<FillingProvider>(
                builder: (context, fillingProvider, _) => ToggleButtons(
                  isSelected: fillingProvider.itemStatus,
                  onPressed: (int index) {
                    fillingProvider.item(index);
                    gender.text = jenisKelamin[index];
                  },
                  renderBorder: false,
                  color: Colors.blue,
                  selectedColor: Colors.white,
                  splashColor: Colors.transparent,
                  selectedBorderColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  fillColor: Colors.white,
                  children: List<Widget>.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.only(top: 12, right: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: fillingProvider.itemStatus[index]
                              ? const Color(0xff0085FF)
                              : Colors.white,
                          border: Border.all(color: const Color(0xff0085FF)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 2.38,
                        height: 40,
                        child: Text(
                          jenisKelamin[index],
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const CreateSuccessAccountScreen()),
                              (route) => false);
                        }
                        handleRegister();
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
