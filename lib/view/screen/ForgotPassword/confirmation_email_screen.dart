import 'package:dio/dio.dart';
import 'package:empathi_care/view/screen/ForgotPassword/verification_email_screen.dart';
import 'package:empathi_care/view_model/forgot_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmationEmailScreen extends StatefulWidget {
  const ConfirmationEmailScreen({super.key});

  @override
  State<ConfirmationEmailScreen> createState() =>
      _ConfirmationEmailScreenState();
}

class _ConfirmationEmailScreenState extends State<ConfirmationEmailScreen> {
  @override
  Widget build(BuildContext context) {
    final forgotPasswordViewModel =
        Provider.of<ForgotPasswordViewModel>(context, listen: false);

    void handleSendEmailConfirmation() async {
      if (forgotPasswordViewModel.formKey.currentState!.validate()) {
        try {
          await forgotPasswordViewModel.sendEmailConfirmation(
              email: forgotPasswordViewModel.emailController.text);

          final snackBar = SnackBar(
            content: Text('${forgotPasswordViewModel.message?.message}'),
            backgroundColor: const Color(0XFF0085FF),
          );

          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => const VerificationEmailScreen()),
            );
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

        forgotPasswordViewModel.emailController.clear();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lupa Kata Sandi',
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
              Column(
                children: [
                  Image.asset('assets/images/bank-security.png'),
                  Text(
                    'Silahkan tulis email untuk menerima kode konfirmasi untuk mengatur kata sandi baru',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Form(
                      key: forgotPasswordViewModel.formKey,
                      child: Column(
                        children: [
                          EmailTextInput(
                              emailController:
                                  forgotPasswordViewModel.emailController),
                          const SizedBox(height: 20),
                          ConfirmationButton(
                              handleSendEmailConfirmation:
                                  handleSendEmailConfirmation),
                        ],
                      )),
                ],
              )
            ],
          )),
    );
  }
}

class ConfirmationButton extends StatelessWidget {
  const ConfirmationButton({
    super.key,
    required this.handleSendEmailConfirmation,
  });

  final VoidCallback handleSendEmailConfirmation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0XFF0085FF),
          foregroundColor: Colors.white),
      onPressed: handleSendEmailConfirmation,
      child: Text(
        'Konfirmasi Email',
        textAlign: TextAlign.center,
        style:
            GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
      ),
    );
  }
}

class EmailTextInput extends StatelessWidget {
  const EmailTextInput({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w500),
      validator: (value) {
        final RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

        if (value == null || value.isEmpty) {
          return 'Email anda masih kosong';
        } else if (!emailRegExp.hasMatch(value)) {
          return 'Email tidak valid';
        } else {
          return null;
        }
      },
    );
  }
}
