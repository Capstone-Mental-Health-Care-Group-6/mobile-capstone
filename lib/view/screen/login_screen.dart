import 'package:empathi_care/view/screen/Register/register_screen.dart';
import 'package:empathi_care/view_model/logreg_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LogRegProvider logRegProvider;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    logRegProvider = Provider.of<LogRegProvider>(context, listen: false);
    logRegProvider.visiblePassword = true;
    emailController.clear();
    passwordController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 100.59, left: 30, right: 30),
                child: Image.asset(
                  'assets/images/Login.png',
                  width: 400,
                  height: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 20),
                child: Text(
                  'Masuk',
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
                  'Selamat Datang di Aplikasi EmpathiCare!, Untuk masuk silahkan isi data kamu terlebih dahulu ya!',
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
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
                    label: Text('Email'),
                  ),
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
                child: Consumer<LogRegProvider>(
                  builder: (context, loginProvider, _) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: loginProvider.visiblePassword,
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
                            icon: loginProvider.visiblePassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off_outlined),
                            onPressed: () {
                              loginProvider.changeVisible();
                            },
                          ),
                          label: const Text('Password')),
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.w500),
                      validator: (value) {
                        if (value! == '') {
                          return 'Password anda masih kosong';
                        } else {
                          return null;
                        }
                      },
                    );
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.only(right: 20, top: 4),
                child: GestureDetector(
                  child: Text(
                    'Lupa Kata Sandi?',
                    style: GoogleFonts.montserrat(
                        fontSize: 11,
                        color: const Color(0xff006FD4),
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () {
                    Feedback.forTap(context);
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
                      foregroundColor: Colors.white),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (_) => Dummy()));
                  },
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun?',
                      style: GoogleFonts.montserrat(
                          color: const Color(0xff959595), fontSize: 14),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: GestureDetector(
                        child: Text(
                          'Daftar',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              color: const Color(0xff006FD4),
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const RegisterScreen()));
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
//
