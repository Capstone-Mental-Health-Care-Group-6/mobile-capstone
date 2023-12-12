import 'package:empathi_care/view/screen/ForgotPassword/verification_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmationEmailScreen extends StatefulWidget {
  const ConfirmationEmailScreen({super.key});

  @override
  State<ConfirmationEmailScreen> createState() =>
      _ConfirmationEmailScreenState();
}

class _ConfirmationEmailScreenState extends State<ConfirmationEmailScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  EmailTextInput(emailController: emailController),
                  const SizedBox(height: 20),
                  const ConfirmationButton(),
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
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color(0XFF0085FF),
          foregroundColor: Colors.white),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const VerificationEmailScreen()),
        );
      },
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
        if (value! == '') {
          return 'Email anda masih kosong';
        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(value)) {
          return 'Email tidak Valid';
        } else {
          return null;
        }
      },
    );
  }
}
