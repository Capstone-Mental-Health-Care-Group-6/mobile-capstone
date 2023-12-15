import 'package:empathi_care/view/screen/Register/filling_profile/filling_profile_1_screen.dart';
import 'package:empathi_care/view/screen/login_screen.dart';
import 'package:empathi_care/view/screen/Register/terms_screen.dart';
import 'package:empathi_care/view_model/password_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late PasswordProvider passwordProvider;
  @override
  void initState() {
    passwordProvider = Provider.of(context, listen: false);
    passwordProvider.check = false;
    passwordProvider.visiblePassword = true;
    passwordProvider.visiblePassword2 = true;
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 67.36, left: 30, right: 30),
                child: Image.asset(
                  'assets/images/Register.png',
                  width: 400,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: Text(
                  'Daftar',
                  style: GoogleFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0085FF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 20, right: 12),
                child: Text(
                  'Selamat Datang di Aplikasi EmpathiCare!, Untuk Masuk silahkan Daftar dan mengisi data kamu terlebih dahulu ya!',
                  style: GoogleFonts.montserrat(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF002C55),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.email_outlined,
                          size: 24,
                        ),
                      ),
                      label: Text('Email')),
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (value! == '') {
                      return 'Email anda masih kosong';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Email tidak Valid';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 13, right: 20),
                child: Consumer<PasswordProvider>(
                  builder: (context, passwordProvider, _) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: passwordProvider.visiblePassword,
                      keyboardType: TextInputType.visiblePassword,
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
                          label: const Text('Password')),
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w500),
                      validator: (value) {
                        if (value! == '') {
                          return 'Password anda masih kosong';
                        } else if (!RegExp(r'^(?=.*[A-Z]).+$')
                            .hasMatch(value)) {
                          return 'Password harus mempunyai minimum 1 huruf kapital';
                        } else if (!RegExp(r'^(?=.*[a-z]).+$')
                            .hasMatch(value)) {
                          return 'Password harus mempunyai minimum 1 huruf kecil';
                        } else if (!RegExp(r'^(?=.*?[0-9]).+$')
                            .hasMatch(value)) {
                          return 'Password harus mempunyai minimum 1 angka';
                        } else if (!RegExp(r'^.{8,}$').hasMatch(value)) {
                          return 'Password harus mempunyai minimum 8 karakter';
                        } else if (value != confirmPasswordController.text) {
                          return 'Password tidak sama';
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 13, right: 20),
                child: Consumer<PasswordProvider>(
                  builder: (context, passwordProvider, _) {
                    return TextFormField(
                      controller: confirmPasswordController,
                      obscureText: passwordProvider.visiblePassword2,
                      keyboardType: TextInputType.visiblePassword,
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
                          label: const Text('Konfirmasi Password')),
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w500),
                      validator: (value) {
                        if (value! == '') {
                          return 'Password anda masih kosong';
                        } else if (value != passwordController.text) {
                          return 'Password tidak sama';
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 12, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(370, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0XFF0085FF),
                      foregroundColor: const Color.fromRGBO(255, 255, 255, 1)),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                    } else {
                      if (passwordProvider.check != true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Syarat dan ketentuan belum di setujui'),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => FillingProfile1()));
                      }
                    }
                  },
                  child: Text(
                    'Daftar',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 12, left: 5, right: 38),
                  child: Consumer<PasswordProvider>(
                    builder: (context, passwordProvider, child) =>
                        Row(children: [
                      Checkbox(
                        value: passwordProvider.check,
                        activeColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xff0085FF)),
                        onChanged: (value) =>
                            passwordProvider.changeCheck(value),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      Expanded(
                        child: RichText(
                          overflow: TextOverflow.clip,
                          text: TextSpan(
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff959595),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.6),
                            children: [
                              const TextSpan(
                                  text: 'Saya telah membaca dan menyetujui '),
                              TextSpan(
                                text: 'syarat dan ketentuan',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff006FD4),
                                  fontWeight: FontWeight.w600,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Feedback.forTap(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const TermsScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sudah punya akun?',
                      style: GoogleFonts.montserrat(
                          color: const Color(0xff959595), fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: GestureDetector(
                        child: Text(
                          'Masuk',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: const Color(0xff006FD4),
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const LoginScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
