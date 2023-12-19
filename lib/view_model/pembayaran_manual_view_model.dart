import 'dart:developer';

import 'package:empathi_care/model/services/active_package_services.dart';
import 'package:empathi_care/model/services/pembayaran_manual_service.dart';
import 'package:empathi_care/view_model/konseling_view_model.dart';
import 'package:empathi_care/view_model/paket_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranManualProvider extends ChangeNotifier {
  String fileImage = "";
  bool isLoading = false;
  int? patientId;
  PembayaranManualService pembayaranManualService = PembayaranManualService();
  late PaketProvider paketProvider;
  late KonselingProvider konselingProvider;
  late PsikologProvider psikologProvider;
  late ProfilePsikologProvider profilePsikologProvider;

  void init(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    // ignore: use_build_context_synchronously
    paketProvider = context.read<PaketProvider>();
    konselingProvider = context.read<KonselingProvider>();
    psikologProvider = context.read<PsikologProvider>();
    profilePsikologProvider = context.read<ProfilePsikologProvider>();
    fileImage = "";
    final JwtService jwtService = JwtService();
    patientId = jwtService.getTokenId(pref.getString("accesstoken").toString());
  }

  Future<bool> addTransaction() async {
    try {
      Map<String, dynamic> params = {
        "price_method": paketProvider
            .listMethods[paketProvider.selectedMetode - 1]['additional_price']
            .toString(),
        "price_counseling": paketProvider
            .listPaket[paketProvider.selectedPaket!]['price']
            .toString(),
        "price_duration": paketProvider
            .listDuration[paketProvider.selectedDuration - 1]
                ['additional_price']
            .toString(),
        "payment_type": "manual",
        "doctor_id": "13",
        "topic_id": "1",
        "patient_id": "2",
        "method_id": paketProvider.listMethods[paketProvider.selectedMetode - 1]
                ['id']
            .toString(),
        "duration_id": paketProvider
            .listDuration[paketProvider.selectedDuration - 1]['id']
            .toString(),
        "counseling_id": paketProvider.listPaket[paketProvider.selectedPaket!]
                ['id']
            .toString(),
        "counseling_session": paketProvider
            .listPaket[paketProvider.selectedPaket!]['sessions']
            .toString(),
        "counseling_type": "A",
      };

      final response =
          await pembayaranManualService.addTransaction(fileImage, params);

      if (response != null) {
        log(response.toString());
        return true;
      } else {
        log(response.toString());
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  void showDialogImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _imageSelector("camera", context);
                },
                child: const ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Kamera"),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _imageSelector("gallery", context);
                },
                child: const ListTile(
                  leading: Icon(Icons.folder),
                  title: Text("Galeri"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future _imageSelector(String pickerType, BuildContext context) async {
    XFile? imageFile;
    switch (pickerType) {
      case "gallery":
        try {
          imageFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100);
        } catch (e) {
          PermissionStatus permission = await Permission.storage.status;
          if (permission == PermissionStatus.denied) {
            //? Requesting the permission
            PermissionStatus statusDenied = await Permission.storage.request();
            if (statusDenied.isPermanentlyDenied) {
              //? permission isPermanentlyDenied
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Perhatian!",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text("Aplikasi memerlukan beberapa izin untuk dapat berjalan dengan baik. Apakah anda ingin mengaktifkannya?"),
                      ],
                    ),
                    actions: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Batal",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Pengaturan",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }

        break;

      case "camera":
        try {
          imageFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 80);
        } catch (e) {
          PermissionStatus permission = await Permission.camera.status;
          if (permission == PermissionStatus.denied) {
            //? Requesting the permission
            PermissionStatus statusDenied = await Permission.camera.request();
            if (statusDenied.isPermanentlyDenied) {
              //? permission isPermanentlyDenied
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Perhatian!",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text("Aplikasi memerlukan beberapa izin untuk dapat berjalan dengan baik. Apakah anda ingin mengaktifkannya?"),
                      ],
                    ),
                    actions: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Batal",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Pengaturan",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }

        break;
    }

    if (imageFile != null) {
      log("You selected  image : ${imageFile.path}");
      fileImage = imageFile.path;
      notifyListeners();
    } else {
      log("You have not taken image");
    }
  }

  void onTapRemove() {
    fileImage = "";
    notifyListeners();
  }
}
