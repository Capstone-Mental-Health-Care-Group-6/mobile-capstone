import 'package:empathi_care/view_model/enabled_button_provider.dart';
import 'package:empathi_care/view_model/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late EnabledButton enabledButton;

  @override
  void initState() {
    enabledButton = Provider.of(context, listen: false);
    super.initState();
    enabledButton.passwordBaru.addListener(() {
      enabledButton.enable();
    });
    enabledButton.passwordLama.addListener(() {
      enabledButton.enable();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ubah Kata Sandi',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        surfaceTintColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Silahkan masukkan Kata Sandi Baru untuk akun Anda',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  top: 24,
                ),
                child: Consumer<PasswordProvider>(
                  builder: (context, passwordProvider, _) => TextFormField(
                    controller: enabledButton.passwordLama,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordProvider.visiblePassword,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 13),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.lock_outline),
                        ),
                        suffixIcon: IconButton(
                          icon: passwordProvider.visiblePassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined),
                          onPressed: () {
                            passwordProvider.changeVisible();
                          },
                        ),
                        label: const Text('Kata Sandi Lama')),
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    validator: (value) {
                      if (value! == '') {
                        return 'Password anda masih kosong';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  top: 24,
                ),
                child: Consumer<PasswordProvider>(
                  builder: (context, passwordProvider, _) => TextFormField(
                    controller: enabledButton.passwordBaru,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordProvider.visiblePassword2,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 13),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Icon(Icons.lock_outline),
                        ),
                        suffixIcon: IconButton(
                          icon: passwordProvider.visiblePassword2
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off_outlined),
                          onPressed: () {
                            passwordProvider.changeVisible2();
                          },
                        ),
                        label: const Text('Kata Sandi Baru')),
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                    validator: (value) {
                      if (value! == '') {
                        return 'Password anda masih kosong';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 30),
                child: Consumer<EnabledButton>(
                  builder: (context, enabledButton, _) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: const Color(0xff959595),
                        minimumSize: const Size(370, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0XFF0085FF),
                        foregroundColor: Colors.white),
                    onPressed: enabledButton.isNull
                        ? () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                content: SizedBox(
                                  width: 219,
                                  height: 147,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.task_alt,
                                        size: 80,
                                        color: Color(0xff0085FF),
                                      ),
                                      Text(
                                        'Data Anda Berhasil diubah',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        : null,
                    child: Text(
                      'Ubah',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
