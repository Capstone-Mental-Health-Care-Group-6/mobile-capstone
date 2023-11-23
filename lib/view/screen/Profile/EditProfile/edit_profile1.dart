import 'package:empathi_care/view_model/filling_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditProfile1 extends StatefulWidget {
  const EditProfile1({super.key});

  @override
  State<EditProfile1> createState() => _EditProfile1State();
}

class _EditProfile1State extends State<EditProfile1> {
  final namaLengkap = TextEditingController();
  final emailController = TextEditingController();
  final datectl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime selectDate = DateTime.now();
  final currentDate = DateTime.now();
  final nomorPonsel = TextEditingController();
  List jenisKelamin = ['Laki - laki', 'Perempuan'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style:
              GoogleFonts.montserrat(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 19, right: 30),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Foto Profil',
                style: GoogleFonts.montserrat(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: GestureDetector(
                  onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => SizedBox(
                            width: double.infinity,
                            height: 220,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ganti foto Profil',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.black,
                                          ))
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25),
                                    child: GestureDetector(
                                      onTap: () {
                                        _pickFile();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.add_photo_alternate,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              'Pilih dari galeri',
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          const Spacer(),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 13),
                                            child: Icon(
                                                Icons.keyboard_arrow_right),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 28, bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.delete,
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            'Hapus foto profil',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                  child: const Stack(children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.camera_alt,
                          size: 20,
                        ))
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                child: TextFormField(
                  controller: namaLengkap,
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]+$')),
                  ],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 17),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.person,
                          size: 24,
                          color: Color(0xff636363),
                        ),
                      ),
                      label: Text(
                        'Nama Lengkap',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      hintText: 'Tara Pramudya',
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (value! == '') {
                      return 'Nama Lengkap Masih Kosong';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 17),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.email_outlined,
                          size: 24,
                        ),
                      ),
                      hintText: 'tara1945@email.com',
                      label: Text('Email',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w500),
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
                padding: const EdgeInsets.only(
                  top: 24,
                ),
                child: Text(
                  'Jenis Kelamin',
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Consumer<FillingProvider>(
                  builder: (context, fillingProvider, _) => ToggleButtons(
                    isSelected: fillingProvider.itemStatus,
                    onPressed: (int index) {
                      fillingProvider.item(index);
                    },
                    borderColor: const Color(0xff959595),
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width / 2.38,
                        minHeight: 35),
                    borderWidth: 0.5,
                    selectedColor: Colors.white,
                    focusColor: Colors.white,
                    fillColor: const Color(0xff0085FF),
                    children: List<Widget>.generate(
                      2,
                      (index) => Text(
                        jenisKelamin[index],
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: TextFormField(
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
                    label: Text('Tanggal Lahir',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: '31 Desember 1999',
                  ),
                  style: GoogleFonts.montserrat(
                      fontSize: 14, fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (value! == '') {
                      return 'Tanggal Lahir Masih Kosong';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: TextFormField(
                  controller: nomorPonsel,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 17),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.phone,
                          size: 24,
                          color: Color(0xff636363),
                        ),
                      ),
                      label: Text('Nomor Ponsel',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                      hintText: '081234567890',
                      floatingLabelBehavior: FloatingLabelBehavior.always),
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.w500),
                  validator: (value) {
                    if (value! == '') {
                      return 'Nomor Telepon Masih Kosong';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(370, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: const Color(0XFF0085FF),
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                    const SizedBox(
                      height: 147.4,
                      width: 219,
                      child: Column(
                        children: [
                          Icon(Icons.task_alt),
                          Text('Data Anda Berhasil diubah'),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Simpan',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

void _pickFile() async {
  final result = await FilePicker.platform
      .pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'png']);
  if (result == null) return;
}
