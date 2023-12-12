import 'package:empathi_care/view/screen/ForgotPassword/change_password_success_screen.dart';
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
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atur Ulang Kata Sandi',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, fontSize: 16)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView(
          children: [
            Image.asset('assets/images/user-account.png'),
            const SizedBox(height: 5),
            Text(
              'Silahkan tulis kata sandi baru Anda',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Consumer<PasswordProvider>(
              builder: (context, passwordProvider, _) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: passwordProvider.visiblePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 13),
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
                      label: const Text('Kata Sandi')),
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (value! == '') {
                      return 'Kata Sandi anda masih kosong';
                    } else if (!RegExp(r'^(?=.*[A-Z]).+$').hasMatch(value)) {
                      return 'Kata Sandi harus mempunyai minimum 1 huruf kapital';
                    } else if (!RegExp(r'^(?=.*[a-z]).+$').hasMatch(value)) {
                      return 'Kata Sandi harus mempunyai minimum 1 huruf kecil';
                    } else if (!RegExp(r'^(?=.*?[0-9]).+$').hasMatch(value)) {
                      return 'Kata Sandi harus mempunyai minimum 1 angka';
                    } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                      return 'Kata Sandi harus mempunyai minimum 8 karakter';
                    } else if (value != confirmPasswordController.text) {
                      return 'Kata Sandi tidak sama';
                    } else {
                      return null;
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 15),
            Consumer<PasswordProvider>(
              builder: (context, passwordProvider, _) {
                return TextFormField(
                  controller: confirmPasswordController,
                  obscureText: passwordProvider.visiblePassword2,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 13),
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
                      label: const Text('Konfirmasi Kata Sandi')),
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (value! == '') {
                      return 'Kata Sandi anda masih kosong';
                    } else if (value != passwordController.text) {
                      return 'Kata Sandi tidak sama';
                    } else {
                      return null;
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: const Color(0XFF0085FF),
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ChangePasswordSuccessScreen()));
                },
                child: Text(
                  'Konfirmasi Kata Sandi',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700, fontSize: 16),
                )),
          ],
        ),
      ),
    );
  }
}
